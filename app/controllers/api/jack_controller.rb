module API
  class JackController < ApplicationController
    def index
      @hikes = Hike.all
      render json: @hikes
    end

    def show
      @hike = Hike.find(params[:id])
      render json: @hike
    end

  end
end
