defmodule RealtimeChat.UserLogsIn do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true

  context "users logs in" do
    context "from the login page" do
      it "redirects to the home page" do
        user = Forge.user
        password = "pass"

        navigate_to session_path(RealtimeChat.Endpoint, :login)
        find_element(:name, "email")
          |> fill_field(user.email)
        find_element(:name, "password")
          |> fill_field(password)
        find_element(:name, "submit")
          |> submit_element

        expect(visible_on_page?(t!("en", "layouts.application.logout"))).to eq true
      end
    end
  end
end
