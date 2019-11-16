# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :safedoc, Safedoc.Account.Guardian,
  issuer: "safedoc",
  secret_key: "CwJiHh8T+v2O75TxqEhudrSktNVT2ZoUbM2DolBRCsmR4krJDE+X8i4955vsYcbw"

config :safedoc,
  ecto_repos: [Safedoc.Repo]

# Configures the endpoint
config :safedoc, SafedocWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+wNjSXh7zmGlr/e5V1jnKXQdbjWNH9ANvS34b4MEu4RAsl+QBAOkVk98PFj0OUjf",
  render_errors: [view: SafedocWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Safedoc.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
