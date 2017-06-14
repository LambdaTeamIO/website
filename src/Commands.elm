module Commands exposing(..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Projects.Models exposing (Project)
import RemoteData

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

