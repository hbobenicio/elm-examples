module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

--  import MainCss

type alias Todo =
  { description : String
  , done : Bool
  }

type alias TodoList =
  List Todo

type alias Model =
  { todos : TodoList
  , newTodo : Todo
  }

type Msg
  = AddTodo
  | SetNewTodo String

model : Model
model =
  { todos =
    [ { description = "Elm Rocks"
      , done = False
      }
    , { description = "Haskell Rocks"
      , done = True
      }
    , { description = "Elixir Rocks"
      , done = False
      }
    ]
  , newTodo = emptyTodo
  }

emptyTodo : Todo
emptyTodo =
  { description = ""
  , done = False
  }

newTodo : String -> Bool -> Todo
newTodo description done =
  { description = description
  , done = done
  }

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddTodo ->
      { model
      | todos = model.todos ++ [ model.newTodo ]
      , newTodo = newTodo "" False
      }
      
    SetNewTodo newTodoDescription ->
      { model | newTodo = (newTodo newTodoDescription False)}

viewTodo : Todo -> Html Msg
viewTodo todo =
  li
    [ classList
      [ ("todo", True)
      , ("done", todo.done)
      ]
    ]
    [ text todo.description ]

viewTodoList : TodoList -> Html Msg
viewTodoList todoList =
  ul [ class "todo-list" ]
    (List.map viewTodo todoList)

viewTodoForm : Html Msg
viewTodoForm =
  div [ id "todo-form" ]
    [ input [ type_ "text", placeholder "New Todo Description...", onInput SetNewTodo ]
      []
    , button [onClick AddTodo] [ text "Add Todo" ]
    ]

view : Model -> Html Msg
view model =
  main_ []
    [ header []
      [ h1 []
        [ text "Todo list" ]
      ]
    , viewTodoList model.todos
    , viewTodoForm
    ]

main : Program Never Model Msg
main =
  Html.beginnerProgram
    { view = view
    , update = update
    , model = model
    }
