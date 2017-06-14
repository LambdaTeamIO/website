module Models exposing (..)

import Projects.Models exposing(Project)
import RemoteData exposing (WebData)

type alias Model =
  { projects: WebData (List Project)
  , team: List Person
  }

initialModel: Model
initialModel =
  { projects = RemoteData.Loading
  , team = [ Person "Gabriel Volpe" "Senior Software Developer" "", Person "Marcin Sosnicki" "Senior Software Developer" "", Person "Damian Albrun" "Senior Software Developer" "", Person "John Regan" "Senior Software Developer" ""]
  }

type alias Person =
  { name: String
  , title: String
  , picture: String
  }
