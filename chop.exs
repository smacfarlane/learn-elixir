defmodule Chop do
	def guess(a, [b..c]) do
		g = div(b+c, 2)
		IO.puts("Is it #{g}?")
		check_guess(a, g, [b..c])
	end

	def check_guess(a, a, _) do
		IO.puts("Your number is #{a}")
	end 

	def check_guess(a, g, [b..c]) when a < g do
		IO.puts("Real: #{a}, Guess: #{g}, Range: [#{b}..#{c}]")
		guess(a, [b..g])
	end

	def check_guess(a, g, [b..c]) when a > g do
		IO.puts("Real: #{a}, Guess: #{g}, Range: [#{b}..#{c}]")
		guess(a, [g..c])
	end	


end