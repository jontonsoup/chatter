# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :realtime_chat, RealtimeChat.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "AEwcrny18MOdrpYA1zNIynZsafyeWwGzONS1QjxKJWJiGBoKXaUQdBkqgw1OkYHs",
  debug_errors: false,
  pubsub: [name: RealtimeChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :addict, not_logged_in_url: "/error",  # the URL where users will be redirected to
                db: RealtimeChat.Repo,
                user: RealtimeChat.User,
                register_from_email: "Registration <welcome@yourawesomeapp.com>", # email registered users will receive from address
                register_subject: "Welcome to yourawesomeapp!", # email registered users will receive subject
                password_recover_from_email: "Password Recovery <no-reply@yourawesomeapp.com>",
                password_recover_subject: "You requested a password recovery link",
                email_templates: RealtimeChat.Presenters.EmailPresenter # email templates for sending e-mails, more on this further down

config :addict, mailgun_domain: "sandbox3740e7c296c9419e9cb2cd1b37c82cbc.mailgun.org",
                mailgun_key: "key-5879bf2c27d62c24cd8df72cd9d3e37e"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
