use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :realtime_chat, RealtimeChat.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  watchers: [
    {Path.expand("node_modules/webpack/bin/webpack.js"), ["--watch", "--colors", "--progress"]},
    node: ["node_modules/brunch/bin/brunch", "watch"]
    ]

# Watch static and templates for browser reloading.
config :realtime_chat, RealtimeChat.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :realtime_chat, RealtimeChat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "realtime_chat_dev",
  size: 10 # The amount of database connections in the pool
