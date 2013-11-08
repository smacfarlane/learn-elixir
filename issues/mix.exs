defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [ app: :issues,
      version: "0.0.1",
      elixir: "~> 0.11.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { Issues, [] },
      applications: [:httpotion]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      { :httpotion, github: "myfreeweb/httpotion" }
    ]
  end
end
