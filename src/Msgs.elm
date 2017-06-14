module Msgs exposing (..)

import Projects.Models exposing(Project)
import RemoteData exposing (WebData)

type Msg =
  OnFetchProjects (WebData (List Project))
