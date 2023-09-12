defmodule PipeSpot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PipeSpotWeb.Telemetry,
      # Start the Ecto repository
      PipeSpot.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PipeSpot.PubSub},
      # Start Finch
      {Finch, name: PipeSpot.Finch},
      # Start the Endpoint (http/https)
      PipeSpotWeb.Endpoint
      # Start a worker by calling: PipeSpot.Worker.start_link(arg)
      # {PipeSpot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PipeSpot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PipeSpotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
