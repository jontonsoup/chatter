defmodule RealtimeChat.UserSendsMessage do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true

  alias Addict.Plugs.Authenticated, as: Auth

  @session_opts Plug.Session.init [
    store: :cookie,
    key: "_test",
    encryption_salt: "abcdefgh",
    signing_salt: "abcdefgh"
  ]

  @authenticated_opts Auth.init []

  context "sends a message" do
    context "from a room" do
      it "creates a new user" do
        room = Forge.saved_room(Repo)
        text = "hey!"
        user = Forge.user
        password = "secure"

        navigate_to session_path(RealtimeChat.Endpoint, :register)
        find_element(:name, "email")
          |> fill_field(user.email)
        find_element(:name, "password")
          |> fill_field(password)
        find_element(:name, "username")
          |> fill_field(user.username)
        find_element(:name, "submit")
          |> submit_element

        navigate_to rooms_path(RealtimeChat.Endpoint, :show, room)
#         find_element(:css, "#chat-input")
#           |> fill_field(text)
#         send_keys :enter

#         expect(visible_on_page?(text)).to eq true

#         navigate_to rooms_path(RealtimeChat.Endpoint, :show, room)
#         expect(visible_on_page?(text)).to eq true
      end
    end
  end
end
