defmodule RealtimeChat.Router do
  use RealtimeChat.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug PhoenixLinguist.Plug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    addict :routes
  end

  socket "/ws", RealtimeChat do
    channel "rooms:*", RoomChannel
  end

  scope "/", RealtimeChat do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :login
    get "/register", SessionController, :register
    get "/error", PageController, :error

    resources "/users", UserController
    resources "/rooms", RoomsController
  end

  # scope "/api", RealtimeChat do
  #   pipe_through :api
  # end
end
