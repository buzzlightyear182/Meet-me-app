class VisitsController < ApplicationController

	def index
		@location = Location.find(params[:location_id])
		@visits = @location.visits
	end

	def show
		location = Location.find(params[:location_id])
		@visit = Visit.find(params[:id])
		render plain: "You try to cheat", status: 404 if @visit.location_id != params[:location_id].to_i
	rescue ActiveRecord::RecordNotFound
		render plain: 'Sorry, not found', status: 404
	end

	def new
		@location = Location.find(params[:location_id])
		@visit = Visit.new
	end

	def create
		@location = Location.find(params[:location_id])
		@visit = @location.visits.new visit_params
		@visit.save
		if @visit.save
			flash[:notice] = "Visit created!"
			redirect_to action: 'index', controller: 'visits', location_id: @location.id
		else
			@errors = @visit.errors.full_messages
			render 'new'
		end
	end

	def edit
		@location = Location.find(params[:location_id])
		@visit = Visit.find(params[:id])
	end

	def destroy
		@location = Location.find(params[:location_id])
		visit = @location.visits.find(params[:id]).destroy
		redirect_to action: 'index'
	end

	def update
		@location = Location.find(params[:location_id])
		@visit = @location.visits.find(params[:id])
		if @visit.update_attributes(visit_params)
				redirect_to	action: 'show', id: @visit.id
				flash[:notice] = "Visit updated!"
		else
				@errors	=	@visit.errors.full_messages
				render 'edit'
		end
	end

	private

	def visit_params
		params.require(:visit).permit(:user_name, :from_date, :to_date)
	end

end


