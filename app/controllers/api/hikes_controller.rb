module API
  class HikesController < ApplicationController

    def index
      @hikes = Hike.all
      render template: "hikes/index"
    end

    def show
      @hike = Hike.find(params[:id])
      render template: "hikes/show"
    end

    def new
      @hike = Hike.new
      render template: "hikes/new"
    end

    def create
      # @hike = @user.Hike.build(hike_params)
      @hike = Hike.new(params.require(:hike).permit(:name, :city, :state, :zip))

      if @hike.save
        render json: @hike, status: 201, location: [:api, @hike]
        flash[:notice] = "You added a hike!"
      else
        render json: hike.errors, status: 422
        flash[:notice] = "Sorry, we couldn't save that hike."
      end

    end

    private

    def hike_params
      params.require(:hike).permit(:name, :city, :state, :zip)
    end

    # def destroy
    #   @hike.destroy
    # end

  end
end
