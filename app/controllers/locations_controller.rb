class LocationsController < ApplicationController

	def index
		@locations = Location.all
		# @locations = Location.last_created(7)
		# @locations = Location.in_spain?
	end

	def show
		@location = Location.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		render plain: 'Sorry, not found', status: 404 unless @location
	end

	def new
		@location = Location.new
	end

	def create
		@location = Location.new location_params
		@location.save
		if @location.save
			flash[:notice] = "Location created!"
			redirect_to action:'index', controller:'locations'
		else
			@errors = @location.errors.full_messages
			render 'new'
		end
	end

	def edit
		@location = Location.find(params[:id])
	end

def update
		@location = Location.find(params[:id])
		if @location.update_attributes(location_params)
				redirect_to	action: 'show', id: @location.id
				flash[:notice] = "Location updated!"
		else
				@errors	=	@location.errors.full_messages
				render 'edit'
		end
	end

private

	def location_params
		params.require(:location).permit(:name, :city, :country)
	end

end