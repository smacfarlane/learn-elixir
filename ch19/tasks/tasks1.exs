defmodule Fib do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: Fib.of(n-1) + Fib.of(n-2)
end

IO.puts "Starting"
worker = Task.async(fn -> Fib.of(20) end)

IO.puts "Doing stuff"
IO.puts "#{inspect(worker)}"
IO.puts "Waiting..."

result = Task.await(worker)

IO.puts "Finished! #{result}"
