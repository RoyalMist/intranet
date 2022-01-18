import Config

config :intranet,
  ecto_repos: [Intranet.Repo]

config :intranet, IntranetWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: IntranetWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Intranet.PubSub,
  live_view: [signing_salt: "F7yT/vo/"]

config :intranet, Intranet.Mailer, adapter: Swoosh.Adapters.Local

config :swoosh, :api_client, false

config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :libcluster,
  topologies: [
    intranet: [
      strategy: Cluster.Strategy.Gossip,
      connect: {:net_kernel, :connect_node, []},
      disconnect: {:erlang, :disconnect_node, []},
      list_nodes: {:erlang, :nodes, [:connected]}
    ]
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
