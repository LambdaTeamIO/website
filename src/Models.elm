module Models exposing (..)

import Data.Projects exposing (Projects)
import Data.Team exposing (Team)


type alias Model =
    { projects : Projects
    , team : Team
    }


initialModel : Model
initialModel =
    { projects = Data.Projects.init
    , team = Data.Team.init
    }
