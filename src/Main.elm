module Main exposing (..)

import Html exposing (program)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Msgs exposing (Msg(..))


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- INIT


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
