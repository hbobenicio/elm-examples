module Todo.Service exposing (fetchAll)

import Http
import Todo.Model as TodoModel
import Todo.Msg as TodoMsg


baseURL : String
baseURL =
    "https://jsonplaceholder.typicode.com"

listURL : String
listURL =
    baseURL ++ "/todos"

fetchAll : Cmd TodoMsg.Msg
fetchAll =
    Http.get
        { url = listURL
        , expect = Http.expectJson TodoMsg.TodoListLoaded TodoModel.todoListDecoder
        }
