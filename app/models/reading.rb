class Reading < ActiveRecord::Base
	has_one :location
	has_one :source
end
