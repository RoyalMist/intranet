import Config

config :intranet, Intranet.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "intranet_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :intranet, IntranetWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "rnth0L43WfROlUOlDLNEmXrM8u2g73HKQTTlIUJEsInc7RDubIKtgSqFcKirf30B",
  server: false

config :intranet, Intranet.Mailer, adapter: Swoosh.Adapters.Test

config :logger, level: :warn

config :phoenix, :plug_init_mode, :runtime
