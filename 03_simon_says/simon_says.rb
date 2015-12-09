def echo(response)
	p response
end

def shout(response)
	p response.upcase
end

def repeat(response, n = 2)
	p [response] * n * " "
end

def start_of_word(response ,n)
	p response[0..(n-1)]
end

def first_word(response)
	array = response.split (" ")
	p array[0]
end

def titleize (response)
	not_cap = ['and', 'the', 'over']
	array = response.split.each {|word| word.capitalize! if  !not_cap.include?(word)}
	array[0].capitalize!
	array = array.join(' ')
	p array
end