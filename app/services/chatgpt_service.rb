require 'httparty'

class ChatGPTService
  include HTTParty
  base_uri 'https://api.openai.com/v1'
  headers 'Content-Type' => 'application/json'
  headers 'Authorization' => 'Bearer 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'

  def self.complete(prompt)
    response = post('/completions', body: { prompt: prompt, model: 'gpt-3.5-turbo-instruct', max_tokens: 500 }.to_json)
    JSON.parse(response.body)
  end
end