module Page.Projects exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Data.Projects exposing (Project, Projects)


view : Projects -> Html Msg
view projects =
    div [ class "px4 py2 bg-orange white" ]
        [ h2 [] [ text "Projects" ]
        , list projects
        ]


list : Projects -> Html Msg
list projects =
    div []
        [ div [ class "mxn2 flex flex-wrap" ] (List.map projectBlock projects)
        ]


projectBlock : Project -> Html Msg
projectBlock project =
    div [ class "px2 col-12 sm-col-6 md-col-4" ]
        [ h3 [] [ text project.name ]
        , text project.description
        ]
