defmodule RealtimeChat.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use RealtimeChat.Web, :controller
      use RealtimeChat.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Model
      alias RealtimeChat.Repo
      if Mix.env == "development" do
        require IEx
      end
    end
  end

  def controller do
    quote do
      use Phoenix.Controller
      import Addict.View

      # Alias the data repository and import query/model functions
      alias RealtimeChat.Repo
      import Ecto.Model
      import Ecto.Query, only: [from: 2]

      # Import URL helpers from the router
      import RealtimeChat.Router.Helpers
      if Mix.env == "development" do
        require IEx
      end
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"
      import Addict.View

      import PhoenixLinguist.Helpers
      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Import URL helpers from the router
      import RealtimeChat.Router.Helpers

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML
      if Mix.env == "development" do
        require IEx
      end
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Addict.View
      import RealtimeChat.User
      alias RealtimeChat.User

      # Alias the data repository and import query/model functions
      alias RealtimeChat.Repo
      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      if Mix.env == "development" do
        require IEx
      end

    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
