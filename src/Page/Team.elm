module Page.Team exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Data.Team exposing (Member, Team)


view : List Member -> Html Msg
view team =
    section [ class "px4 mb2" ]
        [ h2 [] [ text "Team" ]
        , list team
        ]


list : List Member -> Html Msg
list members =
    div []
        [ div [ class "flex flex-wrap" ] (List.map memberBlock members)
        ]


memberBlock : Member -> Html Msg
memberBlock member =
    div [ class "px2 col-12 sm-col-6 md-col-3 center" ]
        [ img [ src member.picture, height 240, width 240, class "circle profile-picture" ] []
        , h3 [] [ text member.name ]
        , text member.title
        , memberLinks member
        ]


memberLinks : Member -> Html Msg
memberLinks member =
    div []
        [ a [ class "btn", href member.linkedin, title "LinkedIn" ] [ i [ class "fa fa-linkedin" ] [] ]
        , a [ class "btn", href member.github, title "GitHub" ] [ i [ class "fa fa-github" ] [] ]
        , case member.blog of
            Just blog ->
                a [ class "btn", href blog, title "Blog" ] [ i [ class "fa fa-rss" ] [] ]

            Nothing ->
                text ""
        ]
