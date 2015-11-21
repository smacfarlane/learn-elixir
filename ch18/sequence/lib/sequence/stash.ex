defmodule Sequence.Stash do
  use GenServer
  require Logger

  defmodule State, do: defstruct value: 0, delta: 1

  @vsn "1"

  def start_link(current_number) do
    state = %State{value: current_number}
    {:ok, _pid} = GenServer.start_link(__MODULE__, state)
  end

  def save_state(pid, value, delta) do
    GenServer.cast pid, {:save_state, {value, delta}}
  end

  def get_state(pid) do
    GenServer.call pid, :get_state
  end

  def handle_call(:get_state, _from, state) do
    {:reply, {state.value, state.delta}, {state.value, state.delta}}
  end

  def handle_cast({:save_state, {value, delta}}, _current_value) do
    {:noreply, %State{value: value, delta: delta}}
  end

  def code_change("0", old_state = {value}, _extra) do
    new_state = %State{ value: value,
                        delta: 1
                      }
    Logger.info "Changing code from 0 to 1"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    { :ok, new_state }
  end
end