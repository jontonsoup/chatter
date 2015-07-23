defmodule RealtimeChat.UserLogsIn do
  use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true

  context "users logs in" do
    context "from the login page" do
      it "redirects to the home page" do
        user = Forge.user
        password = "passpasspass"

        login(user, password)
        delete_cookies
        navigate_to "/#/login"
        find_element(:name, "email")
          |> fill_field(user.email)
        find_element(:name, "username")
          |> fill_field(user.username)
        find_element(:name, "password")
          |> fill_field(password)
        submit = find_element(:name, "submit")
        submit_element(submit)

        expect(visible_on_page?(t!("en", "layouts.application.logout"))).to eq true
      end
    end
  end

  def login(user, password) do
    navigate_to session_path(RealtimeChat.Endpoint, :register)
    find_element(:name, "email")
    |> fill_field(user.email)
    find_element(:name, "username")
    |> fill_field(user.username)
    find_element(:name, "password")
    |> fill_field(password)

    submit = find_element(:name, "submit")
    submit_element(submit)
  end
end
