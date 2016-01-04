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

    def about
      render template: "hikes/about"
    end

    def new
      @hike = Hike.new
      render template: "hikes/new"
    end

    def edit
      @hike = Hike.find(params[:id])
      render template: "hikes/edit"
    end

    private

    def hike_params
      params.require(:hike).permit(:name, :city, :state, :zip)
    end

    public

    def create
      @hike = Hike.build(hike_params[:hike])
      if @hike.save
        redirect_to api_hikes_path
        flash[:success] = 'You added @hike.name!'
      else
        render :new
        flash[:error] = 'Sorry, we could not add that hike.'
      end

    end

    def destroy
      @hike = Hike.find(params[:id])
      @hike.destroy
      flash[:success] = 'You deleted @hike.name'
      redirect_to root_path
    end

  end
end
