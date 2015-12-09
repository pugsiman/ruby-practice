require 'rest-client'

print 'What are you looking for? '
query = gets.chomp.downcase

puts RestClient.get "https://www.google.com/search?q=#{query.split.join('+')}"
