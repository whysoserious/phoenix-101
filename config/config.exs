# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :czynopimy,
  ecto_repos: [Czynopimy.Repo]

# Configures the endpoint
config :czynopimy, Czynopimy.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PpXzUGRMY6cXh65Fb/slHEloeJALvTbi0CzYGKOlhq0r+0E16QTl/4WFc6lHyvzu",
  render_errors: [view: Czynopimy.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Czynopimy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
