# README

## Installation

* $ `bundle install`
* $ `rake db:create`
* $ `rake db:migrate`
* $ `rake db:seed`
* $ `rake currentweather:bom`
* $ `rake currentweather:forecastio`
* $ `rails s`


## Set Up Recurring Task
If in "development" environment:

  `whenever --update-crontab`

If in "production":

1. Change the environtment from `development` to `production` in `config/schedule.rb`
2. Run from console `whenever --update-crontab`
