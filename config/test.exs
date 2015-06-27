use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :realtime_chat, RealtimeChat.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :realtime_chat, RealtimeChat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "realtime_chat_test",
  size: 1 # Use a single connection for transactional tests
