defmodule Ch14.Ex4 do
  import :timer, only: [ sleep: 1 ]
  def exit_child(parent) do
    send parent, "Hello"
    raise :too_soon
  end

  def receive_messages do
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        receive_messages
    after 500 ->
      IO.puts "Nothing received. I'm done"
    end
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Ch14.Ex2, :exit_child, [self])

    sleep 500
    receive_messages
  end
end