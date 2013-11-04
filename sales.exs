#Exercise: StringsAndBinaries-7
#Exercies: Records-1  *Updated*

defrecord Sale, id: nil, ship_to: nil, net_amount: nil, tax_amount: nil


defmodule SalesCSV do
  def read(file) do
    file = File.open!(file)

    headers = read_headers(IO.read(file,:line))

    Enum.map(IO.stream(file, :line), &(create_row(headers, &1)))

  end

  defp read_headers(line) do
    csv_to_list_and_map(line, &(binary_to_atom(&1)))
  end

  defp csv_to_list_and_map(line, mapper) do
    line |> String.strip |> String.split(",") |> Enum.map mapper
  end

  defp create_row headers, line do
    Sale.new Enum.zip(headers, csv_to_list_and_map(line, &(entry_to_value(&1))))
  end

  defp entry_to_value value do
    cond do
      Regex.match? %r{^\d+$}, value -> binary_to_integer(value)
      Regex.match? %r{^\d+.\d+$}, value -> binary_to_float(value)
      << ?: :: utf8, name :: binary >> = value -> binary_to_atom(name)
      true -> value
    end
  end
end


defmodule Tax do
  def orders_with_tax orders, taxes do
    orders |> Enum.map &(apply_tax(&1,taxes))
  end
  
  def apply_tax([], _), do: []
  def apply_tax(sale, taxes) do
    tax_amount = Keyword.get(taxes, sale.ship_to, 0.0)
    Sale.new id: sale.id, ship_to: sale.ship_to, net_amount: sale.net_amount, tax_amount: tax_amount
  end

  def calculate_total order=[id: _, ship_to: state, net_amount: net], taxes do
    rate = Keyword.get(taxes, state, 0)
    tax = net * rate
    total = net + tax
    Keyword.put(order, :total, total)
  end
end
