class SearchController < ApplicationController

	def create
		@search = Search.new
		@locations = @search.search_locations(params[:search][:keyword])
		render 'locations/index'
	end
end