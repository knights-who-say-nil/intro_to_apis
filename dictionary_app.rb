require "http"

api_key = "64e90a58d89a8e7f3f000001fe809d0cd55d32cb45b9f117e"

system "clear"

puts "Welcome to the Dictionary App"
puts "~•" * 25
puts ""

print "Enter a Word: "
user_input = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ user_input }/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{ api_key }")

top_example_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ user_input }/topExample?useCanonical=false&api_key=#{ api_key }")

pronounciation_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ user_input }/pronunciations?useCanonical=false&limit=10&api_key=#{ api_key }")

definitions = response.parse

puts ""
puts "Definitions"
puts "=" * 50
puts ""

definitions.each do |definition|
  if definition["text"] != nil
    puts "    • #{definition["partOfSpeech"]} - #{definition["text"]}"
  end
end

puts ""
puts "Top Example"
puts "=" * 50
puts ""

top_example_hash = top_example_response.parse

puts top_example_hash["text"]

puts ""
puts "Pronunciations"
puts "=" * 50
puts ""

pronunciations = pronounciation_response.parse

pronunciations.each do |pronunciation|
  puts  "    • #{pronunciation["raw"]}"
end