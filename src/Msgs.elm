module Msgs exposing (..)

import Github exposing (ApiError, Events)


type Msg
    = FetchEventsResult (Result ApiError Events)
    | NoOp
