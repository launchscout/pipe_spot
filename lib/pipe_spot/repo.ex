defmodule PipeSpot.Repo do
  use Ecto.Repo,
    otp_app: :pipe_spot,
    adapter: Ecto.Adapters.Postgres
end
