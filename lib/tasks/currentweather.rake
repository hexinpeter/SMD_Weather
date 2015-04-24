require "#{Rails.root}/app/support/unit_conversion.rb"

namespace :currentweather do
  include UnitConversion

  desc "Get current weather data from Forecast.io"
  task forecastio: :environment do
    Location.all.each do |station|
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

      p "#{station.name} data has been retrieved from Forecast.io"
    end
  end

  desc "Get current weather data from Bureau of Meterology"
  task bom: :environment do
    page = Nokogiri::HTML(RestClient.get("http://www.bom.gov.au/vic/observations/melbourne.shtml"))
    page.css('table tbody tr').each do |area|
      name = area.css('th').text
      timezone_offset = ActiveSupport::TimeZone.new('Melbourne').utc_offset()
      time = DateTime.parse(area.css('td[headers~="obs-datetime"]').text).to_time - timezone_offset

      reading = Reading.new(time: time)
      reading.source = Source.find_by(name: 'bom')
      reading.location = Location.find_by(name: name)

      current_temperature = area.css('td[headers~="obs-temp"]').text
      dew_temperature = area.css('td[headers~="obs-dewpoint"]').text
      reading.temperature = Temperature.create(value: current_temperature, dew_point: dew_temperature)

      wind_speed = area.css('td[headers~="obs-wind-spd-kph"]').text
      wind_dir = area.css('td[headers~="obs-wind-dir"]').text
      reading.wind = Wind.create(direction: wind_dir, speed: wind_speed)

      rain_since_9 = area.css('td[headers~="obs-rainsince9am"]').text
      reading.precipitation = Precipitation.create(amount: rain_since_9)

      reading.save!
      p "#{name} data has been retrieved from Bureau of Meterology"
    end
  end

end
