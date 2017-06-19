module View exposing (..)

import Html exposing (Html, div, text, p)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models exposing (Model)
import Page.Projects
import Page.Team


view : Model -> Html Msg
view model =
    div [ class "bg-olive" ]
        [ nav
        , page model
        , footer
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-orange" ]
        [ div [ class "left p2" ] [ text "Projects" ]
        , div [ class "left p2" ] [ text "Team" ]
        ]


page : Model -> Html Msg
page model =
    div []
        [ Page.Team.view model.team
        , Page.Projects.view model.projects
        ]


footer : Html Msg
footer =
    div [ class "clearfix white bg-black" ]
        [ p [ class "h2 center" ] [ text "hello@lambdateam.io" ] ]
