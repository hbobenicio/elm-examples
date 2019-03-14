module Todo.Msg exposing (..)

import Http
import Todo.Model exposing (TodoList)

type Msg
    = TodoListLoaded (Result Http.Error TodoList)
    | TodoDeleted Int
