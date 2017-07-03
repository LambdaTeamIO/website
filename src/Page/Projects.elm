module Page.Projects exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Data.Projects exposing (Project, Projects)


view : Projects -> Html Msg
view projects =
    div [ class "mxn2 flex flex-wrap" ] (List.map projectBlock projects)


projectBlock : Project -> Html Msg
projectBlock project =
    div [ class "px2 col-12 sm-col-6 md-col-4" ]
        [ h3 [] [ text project.name ]
        , p [ class "wrap-blanks" ] [ text project.description ]
        ]
