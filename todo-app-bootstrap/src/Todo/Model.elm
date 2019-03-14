module Todo.Model exposing (Todo, TodoList, todoDecoder, todoListDecoder)

import Json.Decode as JD

type alias Todo =
  { id : Int
  , title : String
  , completed : Bool
  }

type alias TodoList = List Todo

todoDecoder : JD.Decoder Todo
todoDecoder =
  JD.map3 Todo
    (JD.field "id" JD.int)
    (JD.field "title" JD.string)
    (JD.field "completed" JD.bool)

todoListDecoder : JD.Decoder (List Todo)
todoListDecoder =
  JD.list todoDecoder
