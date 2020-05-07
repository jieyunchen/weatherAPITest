Feature: Test Weather API

Scenario: Test Get Weather JSON API

Given url 'http://api.weatherapi.com/v1/forecast.json?key=210248d56f7846c8b3265042200505&q=Sydney&days=7'
When method get
Then status 200
Then def nextDayWeather = response.forecast.forecastday[0]
Then match response.location.name == 'Sydney'
Then match nextDayWeather.date == '2020-05-07'
Then match nextDayWeather.day.uv == '3.7'
Then match nextDayWeather.day.avgtemp_c == '17.4'
Then match nextDayWeather.astro.sunrise == '06:34 AM'

Scenario: Test Get Weather SOAP API
Given url 'http://api.weatherapi.com/v1/forecast.xml?key=210248d56f7846c8b3265042200505&q=Sydney&days=7'
When method get
Then status 200
Then match /root/location/name == 'Sydney'
Then match /root/forecast/forecastday[1]/date == '2020-05-07'
Then match /root/forecast/forecastday[1]/day/uv == '3.7'
Then match /root/forecast/forecastday[1]/day/avgtemp_c == '17.4'
Then match /root/forecast/forecastday[1]/astro/sunrise == '06:34 AM'