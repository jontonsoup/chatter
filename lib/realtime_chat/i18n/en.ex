defmodule RealtimeChat.I18n do
  use Linguist.Vocabulary

  locale "en", [
    layouts: [
      application: [
        title: "Chatter",
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
      password: "Password"
    ]
  ]
end
