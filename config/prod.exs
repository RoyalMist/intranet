import Config

config :intranet, IntranetWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"
config :logger, level: :info

config :libcluster,
  topologies: [
    intranet: [
      strategy: Elixir.Cluster.Strategy.DNSPoll
    ]
  ]
