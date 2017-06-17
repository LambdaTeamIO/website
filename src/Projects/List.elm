module Projects.List exposing(..)

import Html exposing(..)
import Html.Attributes exposing(class)
import Msgs exposing (Msg)
import Projects.Models exposing(Project)
import RemoteData exposing (WebData)
import Common.Request exposing(maybeList)

view: WebData (List Project) -> Html Msg
view response =
  div [ class "px4 py2 bg-orange white" ]
      [ h2 [] [ text "Projects" ]
      , maybeList response list
      ]

list: List Project -> Html Msg
list projects =
  div [  ]
      [ div [ class "mxn2 flex flex-wrap" ] (List.map projectBlock projects) 
      ]
  
projectBlock: Project -> Html Msg
projectBlock project =
  div [ class "px2 col-12 sm-col-6 md-col-4" ]
      [ h3 [] [ text project.name ]
      , text project.description
      ]
