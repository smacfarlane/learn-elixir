defmodule Stack do
  use Application

  def start(_type, _args) do
    {:ok, _pid} = Stack.Supervisor.start_link(Application.get_env(:stack, :initial_list))
    # import Supervisor.Spec, warn: false
    #
    # children = [
    #   worker(Stack.Server, [])
    # ]
    #
    # opts = [strategy: :one_for_one, name: Stack.Supervisor]
    #
    # Supervisor.start_link children, opts
  end
end
