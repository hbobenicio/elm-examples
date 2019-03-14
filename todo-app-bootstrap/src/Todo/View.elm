module Todo.View exposing (viewTodoList, viewTodoListTable)

import Bootstrap.Button as Button

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Todo.Model exposing (Todo)
import Todo.Msg as TodoMsg

{-| Converts the completed field of a Todo into a String label

    viewTodoCompleted { completed = True } == "Completed"
    viewTodoCompleted { completed = False } == "Pending"
-}
viewTodoCompleted : Todo -> String
viewTodoCompleted todo =
    if todo.completed then
        "Completed"

    else
        "Pending"


viewTodo : Todo -> Html TodoMsg.Msg
viewTodo todo =
    tr []
        [ td [] [ text (String.fromInt todo.id) ]
        , td [] [ text todo.title ]
        , td [] [ text (viewTodoCompleted todo) ]
        , td []
            [ Button.button
                [ Button.danger
                , Button.attrs
                    [ type_ "button"
                    , onClick (TodoMsg.TodoDeleted todo.id)
                    ]
                ]
                [ text "Delete" ]
            ]
        ]


viewTodoList : List Todo -> List (Html TodoMsg.Msg)
viewTodoList todos =
    List.map viewTodo todos


viewTodoListTable : List Todo -> Html TodoMsg.Msg
viewTodoListTable todoList =
    case todoList of
        [] ->
            p [] [ text "Loading Todo List..." ]

        _ ->
            table []
                ([ tr []
                    [ th [] [ text "ID" ]
                    , th [] [ text "Title" ]
                    , th [] [ text "Completed" ]
                    , th [] [ text "Actions" ]
                    ]
                 ]
                    ++ viewTodoList todoList
                )
