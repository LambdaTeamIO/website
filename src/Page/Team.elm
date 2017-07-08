module Page.Team exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Data.Team exposing (Member, Team)


view : Team -> Html Msg
view team =
    div [ class "flex flex-wrap" ]
        (List.append
            (List.map memberBlock team)
            [ clarificationSentence ]
        )


clarificationSentence : Html Msg
clarificationSentence =
    p [ id "just-devs" ]
        [ text "(Yeah... we are not fashion models, just developers.)" ]


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
        [ a [ class "btn", href member.linkedin, title "LinkedIn", target "_blank" ] [ i [ class "fa fa-linkedin" ] [] ]
        , a [ class "btn", href member.github, title "GitHub", target "_blank" ] [ i [ class "fa fa-github" ] [] ]
        , case member.blog of
            Just blog ->
                a [ class "btn", href blog, title "Blog", target "_blank" ] [ i [ class "fa fa-rss" ] [] ]

            Nothing ->
                text ""
        ]
