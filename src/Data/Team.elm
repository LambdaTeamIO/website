module Data.Team exposing (..)


type alias Team =
    List Member


type alias Member =
    { name : String
    , title : String
    , picture : String
    , linkedin : String
    , github : String
    , blog : Maybe String
    }


init : Team
init =
    [ Member "Gabriel Volpe" "Senior Software Developer" "./assets/profile/gvolpe.jpg" "https://www.linkedin.com/in/gmvolpe/" "https://github.com/gvolpe" (Just "http://partialflow.wordpress.com")
    , Member "Marcin Sosnicki" "Senior Software Developer" "./assets/profile/msosnicki.jpg" "https://www.linkedin.com/in/marcin-so%C5%9Bnicki-8baa5878/" "https://github.com/msosnicki" Nothing
    , Member "Damian Albrun" "Senior Software Developer" "./assets/profile/dalbrun.jpg" "https://www.linkedin.com/in/damian-albrun-b92b074/" "https://github.com/insdami" Nothing
    , Member "John Regan" "Senior Software Developer" "./assets/profile/jregan.jpg" "https://www.linkedin.com/in/john-regan-4b6b1a32/" "https://github.com/johnregan" Nothing
    ]
