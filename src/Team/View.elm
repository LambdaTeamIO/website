module Team.View exposing(..)

import Html exposing(..)
import Html.Attributes exposing(class, src, height, width)
import Msgs exposing (Msg)
import Team.Models exposing(Member)
import RemoteData exposing (WebData)
import Common.Request exposing(maybeList)

view: WebData (List Member) -> Html Msg
view response =
  div [ ]
      [ h2 [] [ text "Team" ]
      , maybeList response list
      ]

list: List Member -> Html Msg
list members =
  div [  ]
      [ div [ class "mxn2 flex flex-wrap" ] (List.map memberBlock members) 
      ]
  
memberBlock: Member -> Html Msg
memberBlock member =
  div [ class "px2 col-12 sm-col-6 md-col-3" ]
      [ img [ src member.picture, height 240, width 240, class "circle" ] [] 
      , h3 [] [ text member.name ]
      , text member.title
      ]
