defmodule Stack.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def start_link initial_list do
    GenServer.start_link(__MODULE__, initial_list, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push value do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def handle_call(:pop, _, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, value}, list) when value < 10 do
    System.halt(value)
  end

  def handle_cast({:push, value}, list) do
    { :noreply, [value | list]}
  end


  def terminate reason, state do
    IO.puts "Terminating because #{inspect reason}."
    IO.puts "Current state: #{inspect state}"
  end
end