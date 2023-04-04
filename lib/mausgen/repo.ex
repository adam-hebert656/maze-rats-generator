defmodule Mausgen.Repo do
  use Ecto.Repo,
    otp_app: :mausgen,
    adapter: Ecto.Adapters.Postgres
end
