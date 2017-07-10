module Main exposing (..)

import Html exposing (Html, h1, text)

main =
  Html.beginnerProgram { model = {}, view = view, update = update }

update msg model =
  model

view model =
  h1 [] [text ("Hello, " ++ who)]

who = "Hugo"
