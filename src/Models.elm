module Models exposing (..)

import Data.Projects exposing (Projects)
import Data.Team exposing (Team)
import Data.Contributions exposing (Contributions)


type alias Model =
    { projects : Projects
    , team : Team
    , contributions : Contributions
    }


initialModel : Model
initialModel =
    { projects = Data.Projects.init
    , team = Data.Team.init
    , contributions = Data.Contributions.init
    }
