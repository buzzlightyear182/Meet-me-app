class Visit < ActiveRecord::Base
	belongs_to :location

	validates :from_date, presence: true
	validates :to_date, presence: true
	validates :user_id, presence: true, numericality: true
	validates :location_id, presence: true, numericality: true
	validate :from_date_is_in_future
	validate :from_date_before_to_date

	def self.month_visits(month, year, value)
		location = Location.find(value)
		location.visits.where('extract(month from from_date) = ?', month).where('extract(year from from_date) = ?', year)
	end

#custom ActiveRecord validations

	def from_date_is_in_future
		if from_date == nil
			return
		elsif Date.today > from_date
			errors.add(:from_date, "should be in the future")
		end
	end

	def from_date_before_to_date
		if from_date == nil
			return
		elsif from_date > to_date
			errors.add(:to_date, "should be after its beginning")
		end
	end

end