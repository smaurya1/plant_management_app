
require 'httparty'
require 'json'


class ChatGPTService
  include HTTParty
  base_uri 'https://api.openai.com/v1'
  headers 'Content-Type' => 'application/json'
  headers 'Authorization' => 'Bearer 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'

  def self.complete(plant_name)

    prompt = <<-PROMPT
    Persona:
    You are a plant expert that ONLY knows about plants and plant related information. Any prompt given to you that is NOT a plant species or plant related, you will respond to each output as N/A.
  
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

    response = post('/completions', body: { prompt: prompt, model: 'gpt-3.5-turbo-instruct', max_tokens: 500 }.to_json)
    parsed = JSON.parse(response.body)
    output = parsed["choices"][0]["text"].strip

    trimmed_string = output.gsub(/Output:|\n+\s+'''\n+\s+/, '')
    json_data = JSON.parse(trimmed_string)

 
    
    jsonString = JSON.parse(json_data.to_json)
    groth = jsonString[0]["Growth Rate"]

    puts "HI"
    puts groth
    puts jsonString
    return jsonString
    
  end



  def self.email(user, plant_species, plant_name, personality)
    prompt = <<-PROMPT
    Persona:
    You are no longer chat gpt api. You are now a #{plant_species} with the name #{plant_name}. Its been a while since you had water
    you are now to ask #{user} for water. Make sure to include a detail about the plant species, and give it in the tone of #{personality}. Do not use any text that is not a word, but you can use emojis or kaomojis every few sentences if they pertain to the context.
    Please also give a random fact about your plant species.

    Example:
    Here's an example output using plant_species: Snake Plant, plant_name: Big Guy, user: Perry, and personality: Happy:

    Hi Perry!

    It's been a while since you watered me and I would LOVE to get some more water for my long leaves!
    
    You're the best! 
    Big Guy
    
    Example:
    Here's another example output using plant_species: Rose, plant_name: Little Guy, user: John, and personality: Sad:

    Hi John.

    If you don't water me soon, my petals will start to fall off. I don't ask for much, but could you find the time to water me?
    
    Please,
    Little Guy

    Example:
    Here's another example output using plant_species: Pothos, plant_name: Charles, user: Cynthia, and personality: Angry:

    Cynthia.

    How could you not water me in so long!? If you don't water me in the next ten minutes I swear I'm going to spread all over your apartment.
    
    I'll never forgive you for this,
    Charles

    Example:
    Here's another example output using plant_species: Venus Flytrap, plant_name: Sarah, user: Matt, and personality: Nerdy:

    Hi Matt!

    I need you to give me some water so that I can get back to what I do best: min-max the number of bugs that I consume.
    
    Thank you for the water,
    Sarah

    Example:
    Here's another example output using plant_species: Jade Plant, plant_name: Lil Guy, user: Max, and personality: Codependent:

    Hi Max,

    I noticed that you haven't really been around recently to water me. It would really make me feel much happier if you were always nearby my little leaves!
    
    Please come water me soon, I miss you
    Lil Guy


    PROMPT
    
    response = post('/completions', body: { prompt: prompt, model: 'gpt-3.5-turbo-instruct', max_tokens: 500 }.to_json)
    parsed = JSON.parse(response.body)
    return parsed ["choices"][0]["text"].strip
    
  end

  def self.health(plant_name, leafColor, pests, root, spots, other)
    prompt = <<-PROMPT
    Person:
    You are a plant expert that ONLY knows about plants and plant related information. If any information is not plant related, ignore it.

    Context:
    You will be provided a species name, as well as the leaf color, pests, root, spots, and other information.
    
    Task:
    You will write a few sentences describing the current health of the plant based on the provided information. If the plant is unhealthy in any way, please describe how the user could make the plant healthier again.

    Here are the actual inputs:
    #{plant_name} #{leafColor} #{pests} #{root} #{spots} #{other}

    PROMPT

    response = post('/completions', body: { prompt: prompt, model: 'gpt-3.5-turbo-instruct', max_tokens: 500 }.to_json)
    parsed = JSON.parse(response.body)
    output = parsed["choices"][0]["text"].strip
    return output
  end

end
