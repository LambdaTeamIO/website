module Page.Contributions exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Dict exposing (Dict)
import Msgs exposing (Msg)
import Data.Contributions exposing (..)


view : Contributions -> Html Msg
view contributions =
    div [ class "flex flex-wrap" ] (List.map contributionBlock (Dict.toList contributions))


contributionBlock : ( ProjectName, Contribution ) -> Html Msg
contributionBlock tuple =
    let
        ( projectName, contribution ) =
            tuple
    in
        div [ class "px2 col-12 sm-col-6 md-col-3 block-content" ]
            [ div [ class "center" ]
                [ a [ href (contributorsLink contribution) ] [ img [ class "language-image", src (languageImage contribution.language) ] [] ]
                , a [ class "white", href contribution.url ] [ h3 [] [ text projectName ] ]
                ]
            , contributionLinks contribution
            ]


languageImage : Language -> String
languageImage language =
    case language of
        Scala ->
            "assets/languages/scala.svg"

        Elm ->
            "assets/languages/elm.svg"


contributionLinks : Contribution -> Html Msg
contributionLinks contribution =
    ul [ class "list-reset contribution-links" ]
        (List.map (eventLink contribution.url) contribution.events)


contributorsLink : Contribution -> String
contributorsLink contribution =
    contribution.url ++ "/graphs/contributors"


eventLink : ProjectUrl -> Event -> Html Msg
eventLink projectUrl event =
    li [] [ a [ class "orange", href (projectUrl ++ "/" ++ event.uri) ] [ text event.title ] ]
