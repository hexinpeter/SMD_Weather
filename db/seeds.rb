# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Location.create(
  name: 'Melbourne (Olympic Park)',
  longtitude: 144.98,
  latitude: -37.83,
  timezone: "Melbourne"
)

Location.create(
  name: "Melbourne Airport",
  longtitude: 144.83,
  latitude: -37.67,
  timezone: "Melbourne"
)

Location.create(
  name: "Avalon",
  longtitude: 144.48,
  latitude:  -38.03,
  timezone: "Melbourne"
)

Location.create(
  name: "Cerberus",
  longtitude: 145.18,
  latitude: -38.36,
  timezone: "Melbourne"
)

Location.create(
  name: "Coldstream",
  longtitude: 145.41,
  latitude: -37.72,
  timezone: "Melbourne"
)

Location.create(
  name: "Cranbourne",
  longtitude: 145.26,
  latitude: -38.13,
  timezone: "Melbourne"
)

Location.create(
  name: "Essendon Airport",
  longtitude: 144.91,
  latitude: -37.73,
  timezone: "Melbourne"
)

Location.create(
  name: "Fawkner Beacon",
  longtitude: 144.93,
  latitude: -37.91,
  timezone: "Melbourne"
)

Location.create(
  name: "Ferny Creek",
  longtitude: 145.35,
  latitude: -37.87,
  timezone: "Melbourne"
)

Location.create(
  name: "Frankston",
  longtitude: 145.12,
  latitude: -38.15,
  timezone: "Melbourne"
)

Location.create(
  name: "Geelong Racecourse",
  longtitude: 144.38,
  latitude: -38.17,
  timezone: "Melbourne"
)

Location.create(
  name: "Laverton",
  longtitude: 144.76,
  latitude: -37.86,
  timezone: "Melbourne"
)

Location.create(
  name: "Moorabbin Airport",
  longtitude: 145.10,
  latitude: -37.98,
  timezone: "Melbourne"
)

Location.create(
  name: "Phillip Island",
  longtitude: 145.15,
  latitude:  -38.5,
  timezone: "Melbourne"
)

Location.create(
  name: "Point Wilson",
  longtitude: 144.54,
  latitude: -38.10,
  timezone: "Melbourne"
)

Location.create(
  name: "Rhyll",
  longtitude: 145.31,
  latitude: -38.46,
  timezone: "Melbourne"
)

Location.create(
  name: "Scoresby",
  longtitude: 145.26,
  latitude: -37.87,
  timezone: "Melbourne"
)

Location.create(
  name: "Sheoaks",
  longtitude: 144.13,
  latitude: -37.91,
  timezone: "Melbourne"
)

Location.create(
  name: "South Channel Island",
  longtitude: 144.80,
  latitude: -38.31,
  timezone: "Melbourne"
)

Location.create(
  name: "Rhyll",
  longtitude: 145.31,
  latitude: -38.46,
  timezone: "Melbourne"
)

Location.create(
  name: "St Kilda Harbour RMYS",
  longtitude: 144.96,
  latitude: -37.86,
  timezone: "Melbourne"
)

Location.create(
  name: "Viewbank",
  longtitude: 145.10,
  latitude: -37.74,
  timezone: "Melbourne"
)

p "Location data seeded!"

Source.create(
  name: "forecastio",
  location: "https://developer.forecast.io"
)

Source.create(
  name: "bom",
  location: "http://www.bom.gov.au/vic/observations/"
)

p "Source data seeded!"


