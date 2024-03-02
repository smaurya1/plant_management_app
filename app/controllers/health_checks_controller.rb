class HealthChecksController < ApplicationController
    #before_action :set_plant, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @plants = current_user.plants
    end
end
