use Mix.Config

config :safedoc, Safedoc.Endpoint,
  secret_key_base: "+wNjSXh7zmGlr/e5V1jnKXQdbjWNH9ANvS34b4MEu4RAsl+QBAOkVk98PFj0OUjfd"

# Configure your database
config :safedoc, Safedoc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "deploy",
  password: "d3ploy",
  database: "safedoc_prod",
  pool_size: 20