module Main exposing (..)

import Navigation exposing (program)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Msgs exposing (Msg(..))


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- INIT


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( initialModel, Cmd.none )



-- MAIN


main : Program Never Model Msg
main =
    program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
