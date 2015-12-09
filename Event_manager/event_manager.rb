require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = 'dc1484e22979437e9baa4319bed59159'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_letters(id, name, form_letter)
  Dir.mkdir('output') unless Dir.exist? 'output'

  filename = "output/thank_#{id}_#{name.capitalize}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

template = File.read 'form_letter.erb'
erb_template = ERB.new template

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_letters(id, name, form_letter)
end
