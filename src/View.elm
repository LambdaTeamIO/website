module View exposing (..)

import Html exposing (Html, section, div, text, p, footer, nav, span, img)
import Html.Attributes exposing (class, id, src)
import Msgs exposing (Msg)
import Models exposing (Model)
import Page.Projects
import Page.Team


view : Model -> Html Msg
view model =
    div []
        [ navigation
        , welcome
        , sections model
        , contact
        ]


navigation : Html Msg
navigation =
    nav [ class "fixed z2 top-0 left-0 right-0 white bg-lambda-green xs-hide" ]
        [ div [ class "left p2" ] [ text "Team" ]
        , div [ class "left p2" ] [ text "Projects" ]
        , div [ class "left p2" ] [ text "Open Source" ]
        , div [ class "left p2" ] [ text "Contact" ]
        ]


welcome : Html Msg
welcome =
    div [ class "parallax white " ]
        [ img [ id "arrow", class "xs-hide sm-hide", src "assets/bouncing-arrow.gif" ] [] ]


sections : Model -> Html Msg
sections model =
    div [ class "white my2 mx2" ]
        [ section [ id "team", class "my2" ] [ Page.Team.view model.team ]
        , section [ id "projects", class "my4" ] [ Page.Projects.view model.projects ]
        ]


contact : Html Msg
contact =
    footer [ class "clearfix white bg-black orange" ]
        [ p [ class "h2 center" ] [ text "hello@lambdateam.io" ] ]
