class Search
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :keyword
	# , :search_results

	def initialize
		self.keyword = keyword
		# @search_results = []
	end

	def search_locations(keyword)
		@search_results = Location.where(city: keyword)
	end

end
