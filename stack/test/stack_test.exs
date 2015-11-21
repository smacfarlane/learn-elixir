defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  setup do
    :sys.replace_state(Stack.Server, fn {_old_state, pid} -> {[1,2,3,4,5], pid} end)
    :ok
  end

  test "push adds to the stack" do
    Stack.Server.push(5)
    {stack, pid} = :sys.get_state Stack.Server
    assert stack == [5,1,2,3,4,5]
  end

  test "pop removes from the stack" do
    assert Stack.Server.pop == 1
    assert Stack.Server.pop == 2
    assert Stack.Server.pop == 3
    assert Stack.Server.pop == 4
    assert Stack.Server.pop == 5
  end
end
