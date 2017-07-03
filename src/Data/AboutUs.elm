module Data.AboutUs exposing (init, AboutUs)


type alias AboutUs =
    { description : String
    }


init : AboutUs
init =
    AboutUs """
We are a bunch of back-end software engineers capable of delivering high quality code for any challenge you might have. Our first language of choice is Scala but we can also write Haskell, Erlang, Clojure, Java and Elm to name a few!

We have decided to join forces and work together from now on as an independent team, having +2 years of experience working together and +10 years average in the Software industry.

Highly experienced on these libraries / tools: Cats, Fs2, Scalaz, Scalaz Streams, Shapeless, Http4s, Akka (persistence, actors, cluster, http and streams) among others. We're also experienced using message brokers such as Apache Kafka and RabbitMQ. NoSql databases such as Cassandra, Elasticsearch and MongoDB. SQL databases such as MySql and PostgreSQL. However, we are not tied to any of these technologies. As engineers, we believe in the phrase "pick the right tool for the right job".

## Why hire a self organised small team?
Small teams have been proven to have higher productivity over their [larger counterparts](https://blog.bufferapp.com/small-teams-why-startups-often-win-against-google-and-facebook-the-science-behind-why-smaller-teams-get-more-done).
With over 2 years experience working together, we are very aware of what we can deliver during challenging time constraints and how to utilize the best of our individual skillsets.

## What are you going to gain?
Cost savings in micromanagement, resource co-ordination and a team that is determined  to constantly beat  aggressive targets. Complex problem solving is in our DNA and with our  passion for writing fault-tolerant software, you will acquire software that can  scale with your business as you grow.

"""
