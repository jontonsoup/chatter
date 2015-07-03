defmodule RealtimeChat.SessionController do
  use RealtimeChat.Web, :controller

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def register(conn, _params) do
    render(conn, "register.html")
  end
end
