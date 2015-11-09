defmodule Stack.Server do
  use GenServer

  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def start_link initial_list do
    GenServer.start_link(__MODULE__, initial_list, name: __MODULE__)
  end

  def init(stash_pid) do
    current_stash = Stack.Stash.get_stack stash_pid
    {:ok, {current_stash, stash_pid}}
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push value do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def handle_call(:pop, _, {[head | tail], stash_pid}) do
    { :reply, head, {tail, stash_pid} }
  end

  def handle_cast({:push, value}, {list, stash_pid}) do
    { :noreply, {[value | list], stash_pid}}
  end

  def terminate reason, state do
    IO.puts "Terminating because #{inspect reason}."
    IO.puts "Current state: #{inspect state}"
  end
end