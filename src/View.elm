module View exposing (..)

import Html exposing (Html, div, text, p, footer, nav)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models exposing (Model)
import Page.Projects
import Page.Team


view : Model -> Html Msg
view model =
    div [ class "bg-olive" ]
        [ navigation
        , page model
        , contact
        ]


navigation : Html Msg
navigation =
    nav [ class "clearfix mb2 white bg-orange xs-hide" ]
        [ div [ class "left p2" ] [ text "Projects" ]
        , div [ class "left p2" ] [ text "Team" ]
        ]


page : Model -> Html Msg
page model =
    div []
        [ Page.Team.view model.team
        , Page.Projects.view model.projects
        ]


contact : Html Msg
contact =
    footer [ class "clearfix white bg-black" ]
        [ p [ class "h2 center" ] [ text "hello@lambdateam.io" ] ]
