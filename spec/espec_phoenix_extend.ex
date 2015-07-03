defmodule ESpec.Phoenix.Extend do

  def model do
    quote do
      alias RealtimeChat.Repo
    end
  end

  def controller do
    quote do
      alias RealtimeChat.Repo
      import RealtimeChat.Router.Helpers
    end
  end

  def request do
    quote do
      alias RealtimeChat.Repo
      import RealtimeChat.Router.Helpers
      import RealtimeChat.I18n
      use Hound.Helpers
      use Hound.Matchers
      Code.require_file("spec/factory.exs")
      before do: Hound.start_session
      finally do: Hound.end_session
    end
  end

  def router do
    quote do

    end
  end

  def view do
    quote do
      import RealtimeChat.Router.Helpers
    end
  end


  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
