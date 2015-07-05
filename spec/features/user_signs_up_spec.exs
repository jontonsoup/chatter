defmodule RealtimeChat.UserSignsUp do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true

  context "users signs up" do
    context "from the register page" do
      it "creates a new user" do
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

        expect(visible_on_page?(t!("en", "sessions.register.title"))).to eq true
      end
    end
  end
end
