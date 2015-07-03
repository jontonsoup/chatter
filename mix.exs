defmodule RealtimeChat.Mixfile do
  use Mix.Project

  def project do
    [
      app: :realtime_chat,
      build_embedded: Mix.env == :prod,
      compilers: [:phoenix] ++ Mix.compilers,
      deps: deps,
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      preferred_cli_env: [espec: :test],
      start_permanent: Mix.env == :prod,
      version: "0.0.1",
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {RealtimeChat, []},
      applications: app_list(Mix.env) ]
  end

  # Specifies which paths to compile per environment
  defp app_list(:all) do
    [
      :cowboy,
      :logger,
      :phoenix,
      :phoenix_ecto,
      :phoenix_html,
      :postgrex,
    ]
  end
  defp app_list(:test) do
    [
      :hound,
      :factory_girl_elixir | app_list(:all)
    ]
  end
  defp app_list(_) do
    app_list(:all)
  end

  #test
  defp elixirc_paths(:test), do: ["lib", "web", "spec"]
  defp elixirc_paths(_),     do: ["lib", "web"]


  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:addict, "~> 0.0.5"},
      {:cowboy, "~> 1.0"},
      {:phoenix, "~> 0.14"},
      {:phoenix_ecto, "~> 0.4"},
      {:phoenix_html, "~> 1.1"},
      {:phoenix_live_reload, "~> 0.4.3", only: :dev},
      {:postgrex, ">= 0.0.0"},

      #test
      { :hound, only: :test, github: "HashNuke/hound" },
      {:espec_phoenix, ">= 0.1.3", only: :test, app: false},
      {:factory_girl_elixir, "~> 0.1.1", only: :test},
    ]

  end
end
