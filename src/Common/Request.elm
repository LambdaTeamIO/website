module Common.Request exposing(..)

import Html exposing(Html, text)
import RemoteData exposing (WebData)
import Msgs exposing (Msg)

maybeList: WebData (List a) -> ((List a) -> Html Msg) -> Html Msg
maybeList response toHTML =
  case response of
    RemoteData.NotAsked ->
      text ""
    RemoteData.Loading ->
      text "Loading ..."
    RemoteData.Success elements ->
      toHTML elements 
    RemoteData.Failure error ->
      text (toString error)


