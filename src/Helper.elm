module Helper exposing (toGithubApi)

import Regex exposing (AtMost, replace, regex)


toGithubApi : String -> String
toGithubApi browseableUrl =
    replace
        (AtMost 1)
        (regex "github.com/(.*?)/")
        (\_ -> "api.github.com/")
        browseableUrl
