defmodule Safedoc.Repo do
  use Ecto.Repo,
    otp_app: :safedoc,
    adapter: Ecto.Adapters.Postgres
end
