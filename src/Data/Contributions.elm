module Data.Contributions exposing (init, ProjectName, ProjectUrl, Contributions, Contribution, Event, Language(..))

import Dict exposing (Dict)


type alias ProjectName =
    String


type alias ProjectUrl =
    String


type alias Contributions =
    Dict ProjectName Contribution


type Language
    = Elm
    | Scala


type alias Event =
    { title : String
    , uri : String
    }


type alias Contribution =
    { url : ProjectUrl
    , events : List Event
    , language : Language
    }


init : Contributions
init =
    mergeContributions insdamiContributions gvolpeContributions
        |> mergeContributions msosnickiContributions
        |> mergeContributions johnreganContributions


mergeContributions : Contributions -> Contributions -> Contributions
mergeContributions leftConts rightConts =
    Dict.merge Dict.insert insertBoth Dict.insert leftConts rightConts Dict.empty


insertBoth : ProjectName -> Contribution -> Contribution -> Contributions -> Contributions
insertBoth projectName leftCont rightCont contributions =
    Dict.insert projectName (addEvents leftCont rightCont) contributions


addEvents : Contribution -> Contribution -> Contribution
addEvents currentContribution newContribution =
    { currentContribution | events = currentContribution.events ++ newContribution.events }


insdamiContributions : Contributions
insdamiContributions =
    let
        contributionsList =
            [ ( "lampepfl/dotty", (Contribution "https://github.com/lampepfl/dotty" [ (Event "Moved literal message into error Message class" "pull/2725") ] Scala) )
            ]
    in
        Dict.fromList contributionsList


gvolpeContributions : Contributions
gvolpeContributions =
    let
        contributionsList =
            [ ( "lampepfl/dotty", (Contribution "https://github.com/lampepfl/dotty" [ (Event "Moved error message to case class scheme" "pull/2731"), (Event "Move 'type argument must be fully defined' message to case class scheme" "pull/2779") ] Scala) ), ( "sirthias/swave", (Contribution "https://github.com/sirthias/swave" [ (Event "Configured Travis and Coveralls. Ignored timing based tests" "pull/11") ] Scala) ), ( "gvolpe/fs2-rabbit", (Contribution "https://github.com/gvolpe/fs2-rabbit" [] Scala) ), ( "functional-streams-for-scala/fs2", (Contribution "https://github.com/functional-streams-for-scala/fs2" [ (Event "Updating example in the README file" "pull/885"), (Event "Link to fs2-rabbit library added." "pull/883") ] Scala) ), ( "ruippeixotog/scala-scraper", (Contribution "https://github.com/ruippeixotog/scala-scraper" [ (Event "ProxyUtils provided" "pull/9") ] Scala) ), ( "mrniko/netty-socketio", (Contribution "https://github.com/mrniko/netty-socketio" [ (Event "OnConnect event not executed in Namespace" "issues/56") ] Scala) ), ( "outworkers/phantom", (Contribution "https://github.com/outworkers/phantom" [ (Event "Creation of keyspace permission problems" "issues/406") ] Scala) ) ]
    in
        Dict.fromList contributionsList


msosnickiContributions : Contributions
msosnickiContributions =
    let
        contributionsList =
            [ ( "lampepfl/dotty", (Contribution "https://github.com/lampepfl/dotty" [ (Event "Moving string error message to dedicated case class" "pull/2740") ] Scala) ), ( "akka/akka", (Contribution "https://github.com/akka/akka" [ (Event "Issue #18945. Fix HandOff problem where Shards may not be killed" "pull/18984") ] Scala) ) ]
    in
        Dict.fromList contributionsList


johnreganContributions : Contributions
johnreganContributions =
    let
        contributionsList =
            [ ( "lampepfl/dotty", (Contribution "https://github.com/lampepfl/dotty" [ (Event "Fix #1589: Reworks with explanation error:modifiers(s) not allowed for 'item'" "pull/2747"), (Event "Combines modifiers not allowed with type, and combinations.This also simplifies logic. Adds more detail to explanation" "pull/2807") ] Scala) ) ]
    in
        Dict.fromList contributionsList
