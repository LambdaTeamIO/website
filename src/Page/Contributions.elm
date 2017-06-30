module Page.Contributions exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Helper exposing (toGithubApi)
import Msgs exposing (Msg)
import Data.Contributions exposing (..)


view : Contributions -> Html Msg
view contributions =
    div [ class "flex flex-wrap" ] (Dict.map contributionBlock contributions)


contributionBlock : ProjectName -> Contribution -> Html Msg
contributionBlock projectName contribution =
    div [ class "px2 col-12 sm-col-6 md-col-3 center" ]
        [ h3 [] [ text projectName ]
        , contributionLinks contribution
        ]


contributionLinks : Contribution -> Html Msg
contributionLinks contribution =
    ul [] [ List.map prLink contribution.pullRequests ]


prLink : PullRequest -> Html Msg
prLink pr =
    li [] [ a [ href pr.url ] [ text pr.title ] ]
