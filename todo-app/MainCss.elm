module MainCss exposing (..)

import Css exposing (..)
-- import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)

type CssClasses
  = LineThrough

type CssIds
    = Page

css : Stylesheet
css =
  (stylesheet << namespace "todo-app")
  [ class LineThrough
    [ textDecoration lineThrough
    ]
  ]
