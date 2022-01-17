defmodule Intranet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Intranet.Repo,
      # Start the Telemetry supervisor
      IntranetWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Intranet.PubSub},
      # Start the Endpoint (http/https)
      IntranetWeb.Endpoint
      # Start a worker by calling: Intranet.Worker.start_link(arg)
      # {Intranet.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Intranet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IntranetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
