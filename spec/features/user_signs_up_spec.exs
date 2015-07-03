defmodule RealtimeChat.UserSignsUp do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true
  alias RealtimeChat.Factory

  context "users signs up" do
    context "from the register page" do
      it "creates a new user" do
        %{ email: email, username: username, password: password } = Factory.attributes_for(:user)

        navigate_to session_path(RealtimeChat.Endpoint, :register)
        find_element(:name, "email")
          |> fill_field(email)
        find_element(:name, "password")
          |> fill_field(password)
        find_element(:name, "username")
          |> fill_field(username)
        find_element(:name, "submit")
          |> submit_element

        expect(visible_on_page?(t!("en", "sessions.register.title"))).to eq true
      end
    end
  end
end
