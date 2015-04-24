class Reading < ActiveRecord::Base
	belongs_to :location
	belongs_to :source

	has_one :temperature
	has_one :wind
	has_one :precipitation

	class << self
		def new_with_unix_time(time)
			Reading.new(time: Time.at(time).utc)
		end

		def new_with_timezone(time, zone)

		end
	end
end
