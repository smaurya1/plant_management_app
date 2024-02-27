require 'httparty'



class ChatGPTService
  include HTTParty
  base_uri 'https://api.openai.com/v1'
  headers 'Content-Type' => 'text/plain'
  headers 'Authorization' => 'Bearer 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'

  def self.complete(plant_name)

    prompt = <<-PROMPT
    Persona:
    You are an expert botanist who knows a lot about plants.
  
    Context:
    You will be provided a name of a plant and are to give back information in a json about this plant.
  
    Task:
    Given this plant name give me a json of information about the plant
  
    Format:
    Your response should be in JSON. You must not provide any other wording or explanation besides the JSON. If you say varies for place of origin, just choose one out of the various locations .  Here is an example delimited by triple quotations: 
  
    '''
    [
    {
        "scientific name": "Sansevieria trifasciata",
        "Watering time(days)": "14",
        "Personality": "Low-maintenance",
        "Sun": "Thrives in indirect sunlight; can tolerate low light conditions",
        "Soil": "Well-draining soil mix, such as cactus or succulent mix",
        "Pests": "Resistant to most pests; can suffer from root rot if overwatered",
        "Care Level": "Easy",
        "Propagation": "Can be propagated from leaf cuttings or rhizome division",
        "Leaf": "Tall, upright leaves with variegated patterns",
        "Fruit": "N/A",
        "Growth Rate": "Slow",
        "Place of origin": "Congo"
    }
    ]
  
    '''
  
    Example: 
    Here is an example input and output that are delimited by triple quotations:
    Input:
    '''
  
    {
    fig
    }
    '''
  
    Output:
    '''
    [
    {
        "scientific name": "Ficus carica",
        "Watering time(days)": "Varies",
        "Personality": "Adaptable",
        "Sun": "Prefers full sun to partial shade",
        "Soil": "Well-draining soil with organic matter",
        "Pests": "Susceptible to aphids, scale, and mealybugs; can develop root rot if overwatered",
        "Care Level": "Moderate",
        "Propagation": "Commonly propagated from cuttings",
        "Leaf": "Large, lobed leaves",
        "Fruit": "Produces edible figs",
        "Growth Rate": "Moderate",
        "Place of origin": "Western Asia"
    }
    ]
  
  
    Here is the actual input 
  
    {
    #{plant_name}
    }
  
    '''
    PROMPT

    response = post('/completions', body: { prompt: prompt, model: 'gpt-3.5-turbo-instruct', max_tokens: 500 })
    response.body
  end
end




