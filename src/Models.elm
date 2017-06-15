module Models exposing (..)

import Projects.Models exposing(Project)
import Team.Models exposing(Member)
import RemoteData exposing (WebData)

type alias Model =
  { projects: WebData (List Project)
  , team: WebData (List Member)
  }

initialModel: Model
initialModel =
  { projects = RemoteData.Loading
  , team = RemoteData.Loading
  }
