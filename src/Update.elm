module Update exposing (update)

import Msgs exposing (Msg(..))
import Models exposing (Model)
import Github exposing (Events, Event, EventAction, EventAction(..))
import Data.Contributions exposing (..)
import Dict


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchEventsResult (Err error) ->
            let
                errorText =
                    (toString error)
            in
                Debug.log
                    errorText
                    model
                    ! []

        FetchEventsResult (Ok eventList) ->
            let
                events =
                    toString (eventsToContributions eventList)
            in
                Debug.log
                    events
                    { model | contributions = updateContributions model.contributions eventList }
                    ! []

        NoOp ->
            model ! []


updateContributions : Contributions -> Events -> Contributions
updateContributions currentContributions events =
    let
        newContributions =
            eventsToContributions events
    in
        Dict.merge Dict.insert existsInBoth Dict.insert currentContributions newContributions Dict.empty


existsInBoth : ProjectName -> Contribution -> Contribution -> Contributions -> Contributions
existsInBoth projectName leftCont rightCont contributions =
    Dict.insert projectName (addPullRequests leftCont rightCont) contributions


addPullRequests : Contribution -> Contribution -> Contribution
addPullRequests currentContribution newContribution =
    { currentContribution | pullRequests = currentContribution.pullRequests ++ newContribution.pullRequests }


eventsToContributions : Events -> Contributions
eventsToContributions eventList =
    let
        onlyPullRequests =
            List.filterMap justPullRequest eventList
    in
        Dict.fromList onlyPullRequests


justPullRequest : Event -> Maybe ( ProjectName, Contribution )
justPullRequest event =
    case event.action of
        EventActionPullRequest pr ->
            Just ( event.repo.name, Contribution event.repo.name event.repo.url [ (PullRequest pr.title pr.url) ] )

        _ ->
            Nothing
