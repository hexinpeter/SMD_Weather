class WeatherController < ApplicationController
  def current
    @locations = Location.all
    @sources = Source.all
  end
end
