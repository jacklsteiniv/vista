module API
  class HikesController < ApplicationController

    def index
      render json: Hike.all
    end

    def show
      render json: Hike.find(params[:id])
    end

    def create
      hike = Hike.new(hike_params)

      if hike.save
        render json: hike, status: 201, location: [:api, hike]
      else
        render json: hike.errors, status: 422
      end
    end

    private

    def hike_params
      params.require(:hike).permit(:name, :city, :state, :zip)
    end

  end
end
