#!/bin/bash
echo "*************************************************************"
echo "This script will print the Current Temperature in Los Angeles"
echo "*************************************************************"
# Los Angeles City ID
city_id=5368361

app_id=68b3eb743c50c4c42591482fe1ff7eec
api_url="http://api.openweathermap.org/data/2.5/weather?id=$city_id&appid=$app_id"

tempf=$(curl -s "$api_url&units=imperial" | awk -F"temp\":" '{print $2}' | awk -F"," '{print $1}')

echo -e "\e[32m$tempf Fahrenheit"

tempc=$(curl -s "$api_url&units=metric" | awk -F"temp\":" '{print $2}' | awk -F"," '{print $1}')

echo -e "\e[32m$tempc Celsius"

if [ -z "$tempf$tempc" ]; then
  echo -e "\e[31mPlease check city id, app id and api url once"
  fi
