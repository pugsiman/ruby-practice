def add (a,b)
	a+b
end

def subtract (a,b)
	a-b
end


def sum (array)
	total = 0
	if array.length > 0
		array.each {|i| total += i}
		return total
	else
		return 0
	end
end

def multiply (array)
	total = 0
	if array.length > 0
		array.each {|i| total *= i}
		return total
	else
		return 0
	end
end

def power (a,b)
	a ** b
end

def factorial (a)
	count = a
	sum = 1
	while count > 0
		sum *= count
		count -= 1
	end
	total
end