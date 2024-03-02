class HealthChecksController < ApplicationController
    before_action :set_plant, only: [:show, :edit, :update, :destroy, :index]
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
        @health_check = HealthCheck.new(health_params)
        @health_check.image.attach(params[:health_check][:image]) if params[:health_check][:image].present?
        if @health_check.save
            redirect_to health_check_path(@health_check)
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
        params.require(:health_check).permit(:leafColor, :pests, :root, :spots, :other, :image, :plant_id)
      end
end
