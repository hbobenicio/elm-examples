module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Card as Card
import Bootstrap.Button as Button


imageWidth : (String, String)
imageWidth = ("width", "20rem")

main =
  Grid.container [] [
    CDN.stylesheet, -- creates an inline style node with the Bootstrap CSS

    Grid.row [] [
		  Grid.col [] [ text "Some content for my view here..."]
    ],

		Card.config [
		  Card.attrs [ style [ imageWidth ] ]
		]
	  |> Card.header [ class "text-center" ] [
		  img [ src "http://elm-bootstrap.info/assets/images/elm-bootstrap.svg", style [imageWidth] ] [],
			h3 [ class "mt-2" ] [ text "Custom Card Header" ]
    ]
    |> Card.block [] [
		  Card.titleH4 [] [ text "Card title" ],
			Card.text [] [ text "Some quick example text to build on the card title and make up the bulk of the card's content." ],
			Card.custom <| Button.button [ Button.primary ] [ text "Go somewhere" ]
    ]
    |> Card.view
  ]

