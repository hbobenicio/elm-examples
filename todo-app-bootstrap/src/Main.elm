module Main exposing (main)

import App
import Browser


main : Program () App.Model App.Msg
main =
    Browser.element
        { init = App.init
        , update = App.update
        , subscriptions = App.subscriptions
        , view = App.view
        }
