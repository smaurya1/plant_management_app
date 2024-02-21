class PlantsController < ApplicationController
    before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to dashboard_path, notice: 'Plant was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to dashboard_path, notice: 'Plant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy
    redirect_to dashboard_path, notice: 'Plant was successfully destroyed.'
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:user_id, :personality_id, :name, :species, :wateringTime)
  end
end
