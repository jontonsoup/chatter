defmodule ESpec.Phoenix.Extend do

  def model do
    quote do
      alias RealtimeChat.Repo
      import RealtimeChat.Forge
      alias RealtimeChat.Forge
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
      import RealtimeChat.Forge
      alias RealtimeChat.Forge
      use Hound.Helpers
      use Hound.Matchers
      before do: Hound.start_session
      finally do
        Hound.end_session
      end

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
