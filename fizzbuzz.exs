fizzbuzz = fn
	{ 0, 0, _ } -> IO.puts "FizzBuzz"
	{ 0, _, _ } -> IO.puts "Fizz"
	{ _, 0, _ } -> IO.puts "Buzz"
	{ _, _, c } -> IO.puts "#{c}"
end

prefizz = fn n ->
	fizzbuzz.({rem(n,3), rem(n,5), n})
end

prefizz.(10)
prefizz.(11)
prefizz.(12)
prefizz.(13)
prefizz.(14)
prefizz.(15)
prefizz.(16)
prefizz.(17)