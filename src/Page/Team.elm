module Page.Team exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Data.Team exposing (Member, Team)


view : Team -> Html Msg
view team =
    div [ class "flex flex-wrap" ] (List.map memberBlock team)


memberBlock : Member -> Html Msg
memberBlock member =
    div [ class "px2 col-12 sm-col-6 md-col-3 center" ]
        [ memberPicture member
        , h3 [] [ text member.name ]
        , memberLinks member
        ]


memberPicture : Member -> Html Msg
memberPicture member =
    div []
        [ img [ src member.picture, height 240, width 240, class "circle profile-picture xs-hide sm-hide" ] []
        , img [ src member.picture, height 128, width 128, class "circle profile-picture md-hide lg-hide" ] []
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
