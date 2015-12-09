class Book
	attr_accessor :title
	
	def title=(name)
		not_cap = ['and', 'the', 'over', 'in', 'of', 'a', 'an']
		words = name.split.each {|word| word.capitalize! if  !not_cap.include?(word)}
		words[0].capitalize!
		@title = words.join(' ')
	end
end