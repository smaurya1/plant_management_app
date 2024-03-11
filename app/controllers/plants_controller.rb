class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @plants = current_user.plants
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.image.attach(params[:plant][:image]) if params[:plant][:image].present?
  
    # chatGPT
    species = params[:plant][:species]
    plantInformationJSON = ChatGPTService.complete(species)

    plant_info = plantInformationJSON[0]
  
    finalPlant = PlantInfo.new(
      plant_id: params[:plant_id],
      scientificName: plant_info['scientific name'],
      wateringTimeDays: plant_info['Watering time(days)'],
      personality: plant_info['Personality'],
      sun: plant_info['Sun'],
      soil: plant_info['Soil'],
      pests: plant_info['Pests'],
      careLevel: plant_info['Care Level'],
      propogation: plant_info['Propagation'],
      leaf: plant_info['Leaf'],
      fruit: plant_info['Fruit'],
      growthRate: plant_info['Growth Rate'],
      origin: plant_info['Place of origin']
    )
  
    @plant.plant_info = finalPlant
  
    if @plant.save
      redirect_to dashboard_path
    else
      render :new
    end
    
    #Chat GPT
    emailContent = ChatGPTService.email(@plant.user_id, @plant.name, @plant.personality)

    if(emailContent?){
      ReminderMailer.with(email: current_user.email, "Water reminder", emailContent ).watering_reminder.deliver_later;
    }

  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      @plant.image.attach(params[:plant][:image]) if params[:plant][:image].present?
  
      # chatGPT
      species = params[:plant][:species]
      plantInformationJSON = ChatGPTService.complete(species)
  
      plant_info = plantInformationJSON[0]
  
      finalPlant = PlantInfo.new(
          plant_id: params[:plant_id],
          scientificName: plant_info['scientific name'],
          wateringTimeDays: plant_info['Watering time(days)'],
          personality: plant_info['Personality'],
          sun: plant_info['Sun'],
          soil: plant_info['Soil'],
          pests: plant_info['Pests'],
          careLevel: plant_info['Care Level'],
          propogation: plant_info['Propagation'],
          leaf: plant_info['Leaf'],
          fruit: plant_info['Fruit'],
          growthRate: plant_info['Growth Rate'],
          origin: plant_info['Place of origin']
        )
        @plant.plant_info.destroy if @plant.plant_info
        @plant.plant_info = finalPlant
  
        if @plant.save
          redirect_to dashboard_path
        else
          render :edit
        end
      else
        render :edit
      end
  end

  def destroy
    @plant.plant_info.destroy
    @plant.destroy
    redirect_to dashboard_path
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:user_id, :personality_id, :name, :species, :wateringTime, :location, :image)
  end
end