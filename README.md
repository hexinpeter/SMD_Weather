# README

## Installation

* $ start Postgres server
* $ `bundle install`
* $ `rake db:create`
* $ `rake db:migrate`
* $ `rake db:seed`
* $ `rake currentweather:bom`
* $ `rake currentweather:forecastio`
* $ `rails s`


## Set Up Recurring Task
If in "development" environment:

1. `whenever --update-crontab`

If in "production":

1. Change the environtment from `development` to `production` in `config/schedule.rb`
2. Run from console `whenever --update-crontab`


## Notice
The values for the "Rainfall amount" of data rows with the source being "bom" will not be empty for the first ten minutes. That is because the BOM only gives the data of "precipitation since 9 am", the "Rainfall amount" can only be calculated by getting the differences from two BOM readings.