defmodule MyEnum
  #Exercise: ListsAndRecursion-5
  def all?([], _func) do
    true
  end

  def all?([head|tail], func) do
    if func.(head)
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: []
  def each([head|tail], func) do
    [func.(head)|each(tail, func)]
  end

  def filter([], _func), do: []
  def filter([head|tail], func) do
    if func.(head)
      [head | filter(tail,func)]
    else
      filter(tail, func)
    end
  end

  def split([], _), do: []
  def split([head:|tail], count) 

  end
end
