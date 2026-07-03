#!/bin/bash
# Fetches weather for current location (auto-detected via IP) using wttr.in

data=$(curl -sf "https://wttr.in/?format=j1" 2>/dev/null)

if [ -z "$data" ]; then
    echo '{"text": "N/A", "tooltip": "Weather unavailable"}'
    exit 0
fi

temp_c=$(echo "$data" | jq -r '.current_condition[0].temp_C')
temp_f=$(echo "$data" | jq -r '.current_condition[0].temp_F')
desc=$(echo "$data" | jq -r '.current_condition[0].weatherDesc[0].value')
humidity=$(echo "$data" | jq -r '.current_condition[0].humidity')
feels_like_c=$(echo "$data" | jq -r '.current_condition[0].FeelsLikeC')
feels_like_f=$(echo "$data" | jq -r '.current_condition[0].FeelsLikeF')
wind_mph=$(echo "$data" | jq -r '.current_condition[0].windspeedMiles')
location=$(echo "$data" | jq -r '.nearest_area[0].areaName[0].value')
region=$(echo "$data" | jq -r '.nearest_area[0].region[0].value')

# Map weather descriptions to Nerd Font icons
code=$(echo "$data" | jq -r '.current_condition[0].weatherCode')
case "$code" in
    113) icon="󰖙" ;;              # Clear/Sunny
    116) icon="󰖕" ;;              # Partly cloudy
    119|122) icon="󰖐" ;;          # Cloudy/Overcast
    143|248|260) icon="󰖑" ;;      # Fog/Mist
    176|263|266|293|296) icon="" ;; # Light rain/drizzle
    299|302|305|308|356|359) icon="" ;; # Heavy rain
    179|182|185|281|284|311|314|317|350) icon="" ;; # Sleet/freezing
    200|386|389|392|395) icon="" ;; # Thunderstorm
    227|230) icon="" ;;            # Blowing snow
    320|323|326|329|332|335|338|368|371|374|377) icon="" ;; # Snow
    *) icon="󰖐" ;;
esac

tooltip="$location, $region\n$desc\nFeels like: ${feels_like_f}°F / ${feels_like_c}°C\nHumidity: ${humidity}%\nWind: ${wind_mph} mph"

echo "{\"text\": \"${icon} ${temp_c}°\", \"tooltip\": \"${tooltip}\"}"
