defmodule Sequence do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    {:ok, _pid} = Sequence.Supervisor.start_link(123)
    # import Supervisor.Spec, warn: false
    #
    # children = [
    #   # Define workers and child supervisors to be supervised
    #   worker(Sequence.Server, [123])
    # ]
    #
    # # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    # Supervisor.start_link(children, opts)
  end
end
