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

    #chatGPT
    species = params[:plant][:species]
    plantInformationJSON = ChatGPTService.complete(species)
    puts plantInformationJSON

    finalPlant = PlantInfo.new(
      plant_id: params[:plant_id],
      scientificName: plantInformationJSON[0]['scientific name'],
      wateringTimeDays: plantInformationJSON[0]['Watering time(days)'],
      personality: plantInformationJSON[0]['Personality'],
      sun: plantInformationJSON[0]['Sun'],
      soil: plantInformationJSON[0]['Soil'],
      pests: plantInformationJSON[0]['Pests'],
      careLevel: plantInformationJSON[0]['Care Level'],
      propogation: plantInformationJSON[0]['Propogation'],
      leaf: plantInformationJSON[0]['Leaf'],
      fruit: plantInformationJSON[0]['Fruit'],
      growthRate: plantInformationJSON[0]['Growth Rate'],
      origin: plantInformationJSON[0]['Place of origin']
    )
    @plant.plant_info = finalPlant

    if @plant.save

      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      @plant.image.attach(params[:plant][:image]) if params[:plant][:image].present?
      redirect_to dashboard_path
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

