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
      if Hike.new(hike_params).save
        redirect_to api_hikes_path
        flash[:success] = 'You added @hike.name!'
      else
        render :new
        flash[:error] = 'Sorry, we could not add that hike.'
      end
      # if @hike.save
      #   render json: @hike, status: 201, location: [:api, @hike]
      #   flash[:notice] = "You added a hike!"
      # else
      #   render json: hike.errors, status: 422
      #   flash[:notice] = "Sorry, we couldn't save that hike."
      # end

    end

    private

    def hike_params
      params.require(:hike).permit(:name, :city, :state, :zip)
    end

    public

    def destroy
      @hike = Hike.find(params[:id])
      @hike.destroy
      flash[:success] = 'You deleted @hike.name'
      redirect_to root_path
    end

  end
end
