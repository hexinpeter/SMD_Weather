class Location < ActiveRecord::Base
	has_many :readings
end
