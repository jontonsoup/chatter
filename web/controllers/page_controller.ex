defmodule RealtimeChat.PageController do
  use RealtimeChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def error(conn, _params) do
    render conn, "error.html"
  end
end
