defmodule Issues do
  use Application.Behaviour

  def main(args) do
    Issues.CLI.run(args)
  end

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Issues.Supervisor.start_link
  end

end
