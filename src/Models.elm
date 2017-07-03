module Models exposing (..)

import Data.Projects exposing (Projects)
import Data.Team exposing (Team)
import Data.Contributions exposing (Contributions)
import Data.AboutUs exposing (AboutUs)


type alias Model =
    { aboutUs : AboutUs
    , projects : Projects
    , team : Team
    , contributions : Contributions
    }


initialModel : Model
initialModel =
    { aboutUs = Data.AboutUs.init
    , projects = Data.Projects.init
    , team = Data.Team.init
    , contributions = Data.Contributions.init
    }
