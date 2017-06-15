module Msgs exposing (..)

import RemoteData exposing (WebData)

import Projects.Models exposing(Project)
import Team.Models exposing(Member)

type Msg =
  OnFetchProjects (WebData (List Project))
  | OnFetchTeam (WebData (List Member))
