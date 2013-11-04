defmodule Parse do
  
  def number([?- | tail]), do: _number_digits(tail, 0) * -1
  def number([?+ | tail]), do: _number_digits(tail, 0) 
  def number(str),         do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end

  #Exercise: StringsAndBinaries-1
  def only_characters?([]), do: true
  def only_characters?([head|tail]) do
    if head in Enum.to_list(? ..?~) do
      only_characters?(tail)
    else
      false
    end
  end
  #Exercise: StringsAndBinaries-1 - Book solution
  def printable_ascii(sqs), do: Enum.all?(sqs, fn ch -> ch in ? ..?~ end)



  #Exercise: StringsAndBinaries-2
  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  #Exercise: StringsAndBinaries-4
  def calculate( expression ) do
    {first, last} = Enum.split_while(expression, &(!(&1 in '+-*/')))
    [op|last] = last



  end

  #Exercise: StringsAndBinaries-5
  def center( strs ) do
    max = Enum.max_by(strs, &(String.length(&1))) |> String.length
    
    strs |> Enum.map(center_string(&1,max)) |> Enum.each(IO.puts(&1))

  end

  def center_string(string, max) do
    padding = div(max - String.length(string)+1, 2)

    "#{String.duplicate(" ",padding)}#{string}#{String.duplicate(" ", padding)}"
  end
end
