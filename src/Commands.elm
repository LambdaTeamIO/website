module Commands exposing (..)

import Http
import RemoteData
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Msgs exposing (Msg)
import Data.Team exposing (Team, Member)
import Data.Projects exposing (Projects, Project)


-- PROJECTS


fetchProjects : Cmd Msg
fetchProjects =
    Http.get fetchProjectsUrl projectsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchProjects


fetchProjectsUrl : String
fetchProjectsUrl =
    "http://localhost:4000/projects"


projectsDecoder : Decode.Decoder Projects
projectsDecoder =
    Decode.list projectDecoder


projectDecoder : Decode.Decoder Project
projectDecoder =
    decode Project
        |> required "name" Decode.string
        |> required "description" Decode.string



-- TEAM MEMBERS


fetchTeam : Cmd Msg
fetchTeam =
    Http.get fetchTeamUrl teamDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchTeam


fetchTeamUrl : String
fetchTeamUrl =
    "http://localhost:4000/team"


teamDecoder : Decode.Decoder Team
teamDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Member
memberDecoder =
    decode Member
        |> required "name" Decode.string
        |> required "title" Decode.string
        |> required "picture" Decode.string
        |> required "linkedin" Decode.string
        |> required "github" Decode.string
        |> optional "blog" (Decode.map Just Decode.string) Nothing
