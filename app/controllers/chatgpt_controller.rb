class ChatgptController < ApplicationController
    def index
      openai_client = OpenAI::Client.new
  
      prompt = params[:prompt] || "Hello world"
      response = openai_client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: prompt }],
          temperature: 0.7,
        }
      )
  
      # Extract the generated text from the response
      @prompt = prompt
      @generated_response = response.dig("choices", 0, "message", "content")
    end
  end
  