defmodule RealtimeChat.UserSignsUp do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true
  alias RealtimeChat.Factory

  context "users signs up" do
    context "from the register page" do
      it "creates a new user" do
        %{ email: email, username: username, password: password } = Factory.attributes_for(:user)

        navigate_to session_path(RealtimeChat.Endpoint, :register)
        email_id = find_element(:name, "email")
        pass_id = find_element(:name, "password")
        username_id = find_element(:name, "username")
        submit_id = find_element(:name, "submit")
        fill_field(email_id, email)
        fill_field(pass_id, password)
        fill_field(username_id, username)
        submit_element(submit_id)

        expect(visible_on_page?("Welcome")).to eq true
      end
    end
  end
end
