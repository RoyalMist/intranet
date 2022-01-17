defmodule Intranet.Repo do
  use Ecto.Repo,
    otp_app: :intranet,
    adapter: Ecto.Adapters.Postgres
end
