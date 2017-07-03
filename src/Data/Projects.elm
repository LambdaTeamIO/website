module Data.Projects exposing (..)


type alias Projects =
    List Project


type alias Project =
    { name : String
    , description : String
    }


init : Projects
init =
    [ Project "Gambling Industry" "Distribution of information using Akka Cluster and Akka Persistence Cassandra. We've been dealing with technical challenges such as network partitions (split brain scenarios), nodes down, cluster sharding and masterslave architecture, among others.\n\nStreaming trading platform built from the scratch using Scalaz Streams consuming Rabbit MQ messages as the main core. Http4s was used for all the HTTP Endpoints. Another technologies such as Scalaz, Shapeless and Monocle were heavily used in the project. All the unit tests have been written using Scala Test in combination with Property Checks. Docker and Docker compose were a fundamental tool for running local and acceptance test environments."
    , Project "Investment Banking Industry" "Scala Trades processing platform that matched orders and allocation instructions using event sourcing and display systems that incorporate CQRS. Many integration challenges such as Kafka, FIX protocol, HotCC, JMS."
    , Project "IoT Industry" "Cloud platform of IoT services to manage hardware such as LED lights and electronic devices across different protocols. Tech stack includes Akka, Finatra, Circe, Docker, RabbitMQ and Mosquitto MQTT."
    , Project "Real State Industry" "Backend for mobile push notifications of real state app. Tech stack includes Akka, Play! Framework, Redis and Apache Kafka. Deployed on Heroku."
    , Project "Gaming Industry" "Design and development of the backend of a mobile / web game. Tech stack includes Web Sockets (socket.io) and Redis."
    , Project "Advertising Industry" "Worked on the Audience Targeting Platform of an American multinational. Main project was tracking audiences on the web and storing their session data in Couchbase/Aerospike. This data is then used to provide the audience with relevant targeted advertisements. Java specialisations dropwizard, Spring MVC, Play"
    , Project "BI Industry" "Web LDAP Manager for one of the biggest BI companies in the market. It reduced operative times by 60% and provided a better customer experience by giving an easy and fast selfservice."
    , Project "TV Industry" "Worked for Cartoon Network LA on a new Content Management. Main achievements include creation and content serving times."
    , Project "Soft Drink Industry" "Full stack development of mainly short innovative projects to support marketing campaigns for one the biggest Drink companies in the world. Tech stack includes Spray, Akka, AngularJS."
    ]
