import Config

config :intranet, Intranet.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "intranet_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :intranet, IntranetWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "PorB9QGDqFExHopQUdp7gcSQm2M7Ubeyv02hL3hwNwlALiBydj4RF5VMgmKUkUBQ",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :intranet, IntranetWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/intranet_web/(live|views)/.*(ex)$",
      ~r"lib/intranet_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
