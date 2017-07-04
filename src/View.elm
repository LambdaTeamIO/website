module View exposing (..)

import Html exposing (Html, section, div, text, p, footer, nav, span, img, h2, a)
import Html.Attributes exposing (class, id, src, href)
import Msgs exposing (Msg)
import Models exposing (Model)
import Page.Projects
import Page.Team
import Page.Contributions
import Page.AboutUs


view : Model -> Html Msg
view model =
    div []
        [ navigation
        , welcome
        , sections model
        , contact
        ]


navigation : Html Msg
navigation =
    nav [ class "fixed z2 top-0 left-0 right-0 white bg-lambda-green xs-hide" ]
        [ div [ class "left p2" ] [ a [ href "#team" ] [ text "Team" ] ]
        , div [ class "left p2" ] [ a [ href "#projects" ] [ text "Projects" ] ]
        , div [ class "left p2" ] [ a [ href "#contributions" ] [ text "Open Source" ] ]
        , div [ class "left p2" ] [ a [ href "#contact" ] [ text "Contact" ] ]
        ]


welcome : Html Msg
welcome =
    div [ class "parallax white " ]
        [ a [ href "#team" ] [ img [ id "arrow", class "xs-hide sm-hide", src "assets/bouncing-arrow.gif" ] [] ] ]


sections : Model -> Html Msg
sections model =
    div [ class "white my2 mx2" ]
        [ section [ id "team", class "my2" ] [ Page.Team.view model.team, Page.AboutUs.view model.aboutUs ]
        , section [ id "projects", class "my4" ] [ h2 [ class "orange center" ] [ text "Industry experience" ], Page.Projects.view model.projects ]
        , section [ id "contributions", class "my4" ] [ h2 [ class "orange center mb4" ] [ text "Contributions" ], Page.Contributions.view model.contributions ]
        ]


contact : Html Msg
contact =
    footer [ class "clearfix white bg-black orange" ]
        [ p [ class "h2 center" ] [ a [ href "mailto: hello@lambdateam.io" ] [ text "hello@lambdateam.io" ] ] ]
