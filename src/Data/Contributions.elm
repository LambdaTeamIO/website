module Data.Contributions exposing (..)

import Dict exposing (Dict)


type alias ProjectName =
    String


type alias ProjectUrl =
    String


type alias Contributions =
    Dict ProjectName Contribution


type alias PullRequest =
    { title : String
    , url : String
    }


type alias Contribution =
    { name : ProjectName
    , url : ProjectUrl
    , pullRequests : List PullRequest
    }


init : Contributions
init =
    Dict.empty
