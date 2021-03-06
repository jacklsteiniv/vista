class HikesController < ApplicationController
    #Only admins can destroy and manipulate hikes. Everyone can view the index.
    #Only logged-in users can create and show hikes.
    # before_action :admin_user,     only: [:destroy, :create, :edit, :update]
    before_action :logged_in_user, only: [:new, :show, :create]

    require 'barometer'

    def index
      @hikes = Hike.all
      render template: "hikes/index"
    end

    def show
      @hike = Hike.find(params[:id])
      # Try adding in barometer API instance variables and call here.

      render template: "hikes/show"
      # @barom = Barometer.new;
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

    def update
      @hike = Hike.find(params[:id])
      if @hike.update_attributes(hike_params)
        flash[:success] = "#{@hike.name} updated"
        redirect_to hikes_path
      else
        render 'edit'
      end

    end

    def create
      @hike = Hike.new(hike_params)
      if @hike.save
        redirect_to hikes_path
        flash[:success] = "You added #{@hike.name}!"
      else
        render :new
        flash[:error] = 'Sorry, we could not add that hike.'
      end

    end

    def destroy
      @hike = Hike.find(params[:id])
      @hike.destroy
      flash[:success] = "You deleted #{@hike.name}"
      redirect_to root_path
    end

    private

    def hike_params
      params.require(:hike).permit(:name, :city, :state, :zip)
    end

  end
