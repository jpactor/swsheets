defmodule EdgeBuilder.Mixfile do
  use Mix.Project

  def project do
    [app: :edge_builder,
     version: "0.0.2",
     elixir: "~> 1.8",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {EdgeBuilder, []}]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.4.11"},
    {:phoenix_pubsub, "~> 1.1"},
    {:phoenix_ecto, "~> 4.0"},
    {:ecto_sql, "~> 3.0"},
    {:plug, "~> 1.7", override: true},
    {:postgrex, "~> 0.15.2"},
    {:phoenix_html, "~> 2.13"},
    {:gettext, "~> 0.17.1"},
    {:ex_spec, "~> 2.0", only: :test},
    {:plug_cowboy, "~> 2.0"},
    {:scrivener_ecto, "~> 2.2"},
    {:comeonin, "~> 3.2"},
    {:httpoison, "~> 1.6"},
    {:poison, "~> 3.1"},
    {:inflex, "~> 2.0"},
    {:mock, "~> 0.3.4", only: :test},
    {:floki, "~> 0.23.1"}]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
