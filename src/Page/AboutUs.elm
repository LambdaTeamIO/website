module Page.AboutUs exposing (view)

import Html exposing (Html, div, p)
import Msgs exposing (Msg)
import Markdown exposing (toHtml)
import Data.AboutUs exposing (AboutUs)


view : AboutUs -> Html Msg
view aboutUs =
    div []
        [ toHtml [] aboutUs.description ]
