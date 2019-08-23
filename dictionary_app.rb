require "http"

response = HTTP.get("https://api.wordnik.com/v4/word.json/school/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

examples = response.parse["examples"]

examples.each do |example|
  p example
  puts ""
end