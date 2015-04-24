class Location < ActiveRecord::Base
  has_many :readings

  validates :name, uniqueness: true
end
