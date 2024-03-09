class HealthChecksController < ApplicationController
    before_action :set_plant, only: [:show, :edit, :update, :destroy, :index, :create, :new]
    before_action :set_health_check, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @health_checks = @plant.health_checks
    end

    def show
    end

    def new
        @health_check = HealthCheck.new
    end

    def create
        @health_check = @plant.health_checks.build(health_params)
        if params[:health_check][:image].present?
            @health_check.image.attach(params[:health_check][:image])
        end

        # chat GPT
        species = @plant.species
        @health_check.doctor = ChatGPTService.health(species, @health_check.leafColor, @health_check.pests, @health_check.root, @health_check.spots, @health_check.other)

        if @health_check.save
            redirect_to plant_health_checks_path(@plant)
        else
            render :new
        end
    end

    def edit
    end

    def update
        # chat GPT
        species = @plant.species
        @health_check.doctor = ChatGPTService.health(species, @health_check.leafColor, @health_check.pests, @health_check.root, @health_check.spots, @health_check.other)
        if @health_check.update(health_params)
          if params[:health_check][:image].present?
            @health_check.image.attach(params[:health_check][:image])
          end
          redirect_to plant_health_check_path(@plant, @health_check)
        else
          render :edit
        end
      end

    def destroy
        @health_check.destroy
        redirect_to plant_health_checks_path(@plant)
    end

    def set_plant
        @plant = Plant.find(params[:plant_id])
    end

    def set_health_check
        @health_check = @plant.health_checks.find(params[:id])
    end

    def health_params
        params.require(:health_check).permit(:plant_id, :leafColor, :pests, :root, :spots, :other, :image, :currentDay)
    end
end
