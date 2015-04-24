require "#{Rails.root}/app/support/unit_conversion.rb"

namespace :currentweather do
	include UnitConversion

  desc "Get current weather data from Forecast.io"
  task forecastio: :environment do
  	station = Location.first
  	result = JSON.parse RestClient.get("https://api.forecast.io/forecast/581e88295e8299482824f5449884df1b/#{station.latitude.to_s},#{station.longtitude.to_s}")
  	reading = Reading.new_with_unix_time result['currently']['time']
  	reading.source = Source.find_by(name: 'forecastio')
  	reading.location = Location.find_by(name: station.name)

  	current_temperature = fahrenheit_to_celsius(result['currently']['temperature'].to_f)
  	dew_temperature = fahrenheit_to_celsius(result['currently']['dewPoint'].to_f)
  	reading.temperature = Temperature.create(value: current_temperature, dew_point: dew_temperature)

  	wind_speed = miles_to_km result['currently']['windSpeed'].to_f
  	wind_dir = bearing_to_dir result['currently']['windBearing'].to_f
  	reading.wind = Wind.create(direction: wind_dir, speed: wind_speed)

  	rain_amount = inch_to_mm result['currently']['precipIntensity'].to_f
  	reading.precipitation = Precipitation.create(amount: rain_amount)

  	reading.save!
  end

  desc "TODO"
  task bom: :environment do
  end

end
