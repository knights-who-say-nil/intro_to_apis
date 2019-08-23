require "http"

response = HTTP.get("https://api.chucknorris.io/jokes/random")

puts response.parse["value"]