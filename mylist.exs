defmodule MyList do
	def len([]), do: 0
	def len([_head|tail]), do: 1 + len(tail)

	def square([]), do: []
	def square([head|tail]), do: [head * head| square(tail)]

	def add_one([]), do: []
	def add_one([head|tail]), do: [head + 1 | add_one(tail)]

end