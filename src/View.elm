module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing(class)
import Msgs exposing (Msg)
import Models exposing (Model)
import Projects.List


view: Model -> Html Msg
view model =
  div []
      [ nav
      , div [ class "px3 lg-px4" ] [ page model ] 
      ]

nav: Html Msg
nav =
  div [ class "clearfix mb2 white bg-black" ]
      [ div [ class "left p2" ] [ text "Projects" ] ]


page: Model -> Html Msg
page model =
  Projects.List.view model.projects
