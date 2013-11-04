defmodule Utf8 do
  def each(str, func) when is_binary(str), do: _each(str, func)
  defp _each(<< head :: utf8, tail :: binary >>, func) do
    func.(head)
    _each(tail, func)
  end

  defp _each(<<>>, _func), do: []

  #Exercise: StringAndBinaries-6
  def capitalize_sentences(string) do
    string |> String.split(". ") |> Enum.map(&String.capitalize(&1)) |> Enum.join(". ")

  end

end

