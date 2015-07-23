defmodule RealtimeChat.I18n do
  use Linguist.Vocabulary

  locale "en", [
    layouts: [
      application: [
        title: "Chatter",
        login: "Login",
        logout: "Log out"
      ]
    ],
    pages: [
      index: [
        title: "Welcome to Chatter"
      ],
    ],
    sessions: [
      register: [
        title: "Register",
      ],
      login: [
        title: "Login",
      ],
      email: "Email",
      username: "Username",
      password: "Password",
      register: "Register"
    ]
  ]
end
