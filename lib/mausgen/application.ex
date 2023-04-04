defmodule Mausgen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MausgenWeb.Telemetry,
      # Start the Ecto repository
      Mausgen.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mausgen.PubSub},
      # Start Finch
      {Finch, name: Mausgen.Finch},
      # Start the Endpoint (http/https)
      MausgenWeb.Endpoint
      # Start a worker by calling: Mausgen.Worker.start_link(arg)
      # {Mausgen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mausgen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MausgenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
