defmodule Intranet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Intranet.Repo,
      IntranetWeb.Telemetry,
      {Phoenix.PubSub, name: Intranet.PubSub},
      IntranetWeb.Endpoint,
      {Cluster.Supervisor,
       [Application.get_env(:libcluster, :topologies), [name: Intranet.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: Intranet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    IntranetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
