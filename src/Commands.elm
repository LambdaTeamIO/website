module Commands exposing(..)

import Http
import RemoteData
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)

import Msgs exposing (Msg)
import Team.Models exposing(Member)
import Projects.Models exposing (Project)

-- PROJECTS

fetchProjects: Cmd Msg
fetchProjects =
  Http.get fetchProjectsUrl projectsDecoder
      |> RemoteData.sendRequest
      |> Cmd.map Msgs.OnFetchProjects

fetchProjectsUrl: String
fetchProjectsUrl =
  "http://localhost:4000/projects"

projectsDecoder: Decode.Decoder (List Project)
projectsDecoder = 
  Decode.list projectDecoder

projectDecoder: Decode.Decoder Project
projectDecoder = 
  decode Project
    |> required "name" Decode.string 
    |> required "description" Decode.string 

-- TEAM MEMBERS

fetchTeam: Cmd Msg
fetchTeam =
  Http.get fetchTeamUrl teamDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnFetchTeam

fetchTeamUrl: String
fetchTeamUrl =
  "http://localhost:4000/team"

teamDecoder: Decode.Decoder (List Member)
teamDecoder =
  Decode.list memberDecoder

memberDecoder: Decode.Decoder Member
memberDecoder =
  decode Member
    |> required "name" Decode.string
    |> required "title" Decode.string
    |> required "picture" Decode.string
    |> required "linkedin" Decode.string
    
