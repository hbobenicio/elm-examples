module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import MainCss

type alias Todo =
  { description : String
  , done : Bool
  }

type alias TodoList =
  List Todo

type alias Model =
  TodoList

type Msg =
  NoOp

model : Model
model =
  [ { description = "Elm Rocks"
    , done = False
    }
  , { description = "Haskell Rocks"
    , done = True
    }
  ]

update : Msg -> Model -> Model
update msg_ model =
  model

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


view : Model -> Html Msg
view model =
  main_ []
    [ header []
      [ h1 []
        [ text "Todo list" ]
      ]
    , viewTodoList model
    ]

main : Program Never Model Msg
main =
  Html.beginnerProgram
    { view = view
    , update = update
    , model = model
    }
