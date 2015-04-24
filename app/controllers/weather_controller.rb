class WeatherController < ApplicationController
  def current
  	@locations = Location.all
  end
end
