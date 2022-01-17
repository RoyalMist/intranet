defmodule IntranetWeb.PageController do
  use IntranetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
