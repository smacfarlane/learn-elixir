defmodule CliTest do
  use ExUnit.Case

  import Weather.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "upcased station name returned if station name given" do
    assert parse_args(["pafa"]) == "PAFA"
    assert parse_args(["Pafa"]) == "PAFA"
    assert parse_args(["PAFA"]) == "PAFA"
  end

end
