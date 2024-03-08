class HealthChecksController < ApplicationController
    before_action :set_plant, only: [:show, :edit, :update, :destroy, :index, :create, :new]
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

        if @health_check.save
            redirect_to plant_health_checks_path(@plant)
        else
            render :new
        end
    end

    def update
        if @health_check.update(health_params)
            @health_check.image.attach(params[:health_check][:image]) if params[:health_check][:image].present?
        else
            render :edit
        end
    end

    def destroy
        @health_check.destroy
        redirect_to health_check_path(@health_check)
    end

    def set_plant
        @plant = Plant.find(params[:plant_id])
    end

    def health_params
        params.require(:health_check).permit(:plant_id, :leafColor, :pests, :root, :spots, :other, :image)
      end
end
