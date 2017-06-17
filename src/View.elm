module View exposing (..)

import Html exposing (Html, div, text, p)
import Html.Attributes exposing(class)
import Msgs exposing (Msg)
import Models exposing (Model)
import Projects.List
import Team.View

view: Model -> Html Msg
view model =
  div [ class "bg-olive" ]
      [ nav
      , page model  
      , footer
      ]

nav: Html Msg
nav =
  div [ class "clearfix mb2 white bg-orange" ]
      [ div [ class "left p2" ] [ text "Projects" ] 
      , div [ class "left p2" ] [ text "Team" ] 
      ]


page: Model -> Html Msg
page model =
  div [ ]
      [ Team.View.view model.team
      , Projects.List.view model.projects 
      ]


footer: Html Msg
footer =
  div [ class "clearfix white bg-black" ]
      [ p [ class "h2 center" ] [ text "hello@lambdateam.io" ] ]
