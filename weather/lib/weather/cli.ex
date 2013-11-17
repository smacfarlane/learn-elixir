defmodule Weather.CLI do

  @moduledoc """
  Handle the command line parsing, fetch the weather data
  for the station specified and display the results
  """

  def run(argv) do
    argv 
   |> parse_args 
   |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help

  Otherwise it is a 4 character station name
  Returns the station as all capital letters, or :help
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                                     aliases:  [h: :help])

    case parse do
    { [help: true], _, _} -> :help
    { _, [station], _ } -> station #String.upcase(station)
    _ -> :help
    end
  end

  
  @doc """
  Takes a station name and fetches the weather data for that station.
  Prints help if station is :help
  """
  def process(:help) do
    IO.puts """
    usage: weather <station>
    """
    System.halt(0)
  end

  def process(station) do
    Weather.NoaaWeather.fetch(station)
    |> decode_response
    |> String.split("\n")
    |> Enum.map(&(String.strip(&1)))
    |> IO.inspect
  end

  def decode_response({:ok, body}), do: body
  def decode_response({:error, msg}) do
    IO.puts "Error fetching from Github: #{msg}"
    System.halt(2)
  end
end
