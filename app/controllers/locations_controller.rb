class LocationsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@locations = Location.all
		@search = Search.new
		# @locations = Location.last_created(7)
		# @locations = Location.in_spain?

		respond_to do |format|
			format.html
			format.json { render :json => @locations.to_json}
		end
	end

	def show
		@location = Location.find(params[:id])
		@comments = @location.comments
	rescue ActiveRecord::RecordNotFound
		render plain: 'Sorry, not found', status: 404 unless @location
	end

	def new
		@location = Location.new
		@location.comments.build
		#build is same as @comment = Comment.new then @comment.location = location
	end

	def create
		@location = Location.new location_params
		@location.user = current_user
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
		@location.comments.build
		if @location.user != current_user
			redirect_to	action: 'index'
			flash[:alert] = "You can not edit a location if you are not the creator"
		end		
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
		params.require(:location).permit(:name, :city, :country,:user_id, comments_attributes: [:id, :text_note, :_destroy]) #comments_attributes :id is ID of comments
	end

end