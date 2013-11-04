defmodule MyList do
	def len([]), do: 0
	def len([_head|tail]), do: 1 + len(tail)

	def square([]), do: []
	def square([head|tail]), do: [head * head| square(tail)]

	def add_one([]), do: []
	def add_one([head|tail]), do: [head + 1 | add_one(tail)]

	def map([], _func), do: []
	def map([head|tail], func), do: [func.(head)|map(tail, func)]

	# def sum(list), do: _sum(list, 0)
	# #Private
	# defp _sum([], total), do: total
	# defp _sum([head|tail], total), do: _sum(tail, head+total)

	#Exercise: ListsAndRecursion-0
	def sum([]), do: 0
	def sum([head|tail]), do: head + sum(tail)

	def reduce([], value, _), 
		do: value
	def reduce([head|tail], value, func) do
		reduce(tail, func.(head, value), func)
	end

	#Exercise: ListsAndRecursion-1
	def mapsum(list, func) do
		newlist = map(list, func)
		reduce(newlist, 0, &(&1 + &2))
	end

	#Exercise: ListsAndRecursion-2
	def max(list), do: _max(list, 0)
	defp _max([], val), do: val
	defp _max([head|tail], val) when head > val, do: _max(tail, head)
	defp _max([_|tail], val), do: _max(tail, val)


	#Exercise: ListsAndRecursion-3
	def caesar(list, val) do
		map(list, &_rotate(&1, val))
	end

	defp _rotate(char, val) when char + val > 122, do: char + val - 26
	defp _rotate(char, val), do: char + val

	#Exercise: ListsAndRecursion-4
	def span(from, to) when from > to, do: []
	def span(from, to) do
		[from | span(from+1, to)]
	end

  #Exercise: ListsAndRecursion-5
  def all?([], _func) do
    true
  end

  def all?([head|tail], func) do
    if func.(head) do
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
    if func.(head) do
      [head | filter(tail,func)]
    else
      filter(tail, func)
    end
  end
  
  def split(list, count), do: _split(list, [], count)
  def _split([], last, _count), do: [[],last]
  def _split(front, last, 0), do: [last, front]
  def _split([head|tail], last, count) do
    _split(tail, [head|last], count-1)
  end

  def take(list, count), do: _take(list, [], count)
  def _take([], coll, _), do: coll
  def _take(_, coll, 0), do: coll
  def _take([head|tail], coll, count) do
    _take(tail, [head|coll], count-1)
  end
  
  #Exercise: ListsAndRecursion-6 (JV Implementation)
  def flatten(list), do: _flatten(list,[])
  def _flatten([head|tail], other) when is_list(head) do
    _flatten(head, _flatten(tail, other))
  end
  def _flatten([head|tail], other) do
    [head | _flatten(tail, other)]
  end
  def _flatten([],tail), do: tail

  #Exercise: ListsAndRecursion-7
  def primes_upto(n) do
    range = span(2,n)
    
    range -- lc a inlist range, b inlist range, a <= b, do: a * b
  end
end
