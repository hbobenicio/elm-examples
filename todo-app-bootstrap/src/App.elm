module App exposing (Model, Msg, init, subscriptions, update, view)

import Bootstrap.Grid as Grid

import Debug
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Todo.Model exposing (Todo, TodoList)
import Todo.Msg
import Todo.Service as TodoService
import Todo.View exposing (viewTodoListTable)

type alias Model =
    { todoList : List Todo
    }


type Msg
    = NoOp
    | InitialState
    | TodoMsg Todo.Msg.Msg


initialState : Model
initialState =
    { todoList = []
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( initialState
    -- Refatorar quando centralizar a estrutura de Msg
    , Cmd.map (\todoMsg -> TodoMsg todoMsg) TodoService.fetchAll
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        InitialState ->
            ( initialState, Cmd.none )

        TodoMsg (Todo.Msg.TodoListLoaded httpResult) ->
            case httpResult of
                Ok todoList ->
                    ( { model | todoList = todoList }, Cmd.none )

                Err err ->
                    Debug.log "Erro ao obter lista de todos..." ( model, Cmd.none )
        TodoMsg (Todo.Msg.TodoDeleted todoID) ->
            let
                newTodoList = List.filter (\t -> t.id == todoID) model.todoList
                newModel = { model | todoList = newTodoList }
                logMsg = "Deleting todo with id: " ++ (String.fromInt todoID)
            in
                (Debug.log logMsg newModel, Cmd.none)

view : Model -> Html Msg
view model =
    Grid.container []
        [ Grid.row []
            [ Grid.col []
                [ main_ []
                    [ h1 [] [ text "/todos" ]
                    , Html.map (\todoMsg -> TodoMsg todoMsg) (viewTodoListTable model.todoList)
                    ]
                ]
            ]
        ]

