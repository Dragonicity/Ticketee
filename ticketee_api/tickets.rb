require "httparty"

token = "Y15e3f3de3133fd6cde6e5c8fdf972bb7"
url = "http://localhost:3000/api/projects/9/tickets/29.json"

response = HTTParty.get(url,
	headers: {
		"Authorization" => "Token token=#{token}"
	}
)
puts response.parsed_response