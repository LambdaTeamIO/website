module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing(class)
import Msgs exposing (Msg)
import Models exposing (Model)
import Projects.List
import Team.View

view: Model -> Html Msg
view model =
  div []
      [ nav
      , page model  
     ]

nav: Html Msg
nav =
  div [ class "clearfix mb2 white bg-black" ]
      [ div [ class "left p2" ] [ text "Projects" ] 
      , div [ class "left p2" ] [ text "Team" ] 
      ]


page: Model -> Html Msg
page model =
  div [ class "px3 lg-px4" ]
      [ Team.View.view model.team
      , Projects.List.view model.projects ]
