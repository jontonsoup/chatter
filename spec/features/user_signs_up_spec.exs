defmodule RealtimeChat.UserSignsUp do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true

  context "users signs up" do
    context "from the register page" do
      it "creates a new user" do
        user = Forge.user
        password = "securesecure"

        navigate_to "/#/register"
        find_element(:name, "email")
          |> fill_field(user.email)
        find_element(:name, "username")
          |> fill_field(user.username)
        find_element(:name, "password")
          |> fill_field(password)

        submit = find_element(:name, "submit")
        submit_element(submit)

        element = find_element(:css, ".logout")
        expect(element).to be_truthy
      end
    end
  end
end
