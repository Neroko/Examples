

# #/bin/bash

### Weather script using the OpenWeatherMap API and jq.
# This method uses the OpenWeatherMap API. It requires a free API key, but gives you more control
# over the data and formatting. It's a great example of a more advanced Bash script.

## Prerequisites:
# Get an API Key:
#		Sign up for a free account on OpenWeatherMap (https://openweathermap.org/).
#		Go to the "API keys" tab in your account and copy your key.
#		Install jq: This is a command-line tool for parsing JSON data. It's essential for this script.
#			On Debian/Ubuntu: sudo apt-get install jq
#			On RedHat/CentOS: sudo yum install jq
#			On macOS (with Homebrew): brew install jq

#	Script: weather-api.sh


# --- CONFIGURATION ---
# Add API key
API_KEY="" 
# Set default city if no argument is given.
DEFAULT_CITY="New York"
# Use "metric" for Celsius or "imperial" for Fahrenheit.
UNITS="imperial" 

# --- SCRIPT LOGIC ---

# Check for dependencies
if ! command -v curl &> /dev/null || ! command -v jq &> /dev/null; then
    echo "Error: Script requires 'curl' and 'jq'. Dependencies need to be installed."
    exit 1
fi

# Check if API key is set
if [[ -z "$API_KEY" ]]; then
    echo "Error: API_KEY is not set."
    echo "Edit script and add OpenWeatherMap API key."
    exit 1
fi

# Determine the city to check
CITY="${1:-$DEFAULT_CITY}"

# Set the correct symbols for the units
if [ "$UNITS" = "metric" ]; then
    UNIT_SYMBOL="°C"
    SPEED_UNIT="m/s"
else
    UNIT_SYMBOL="°F"
    SPEED_UNIT="mph"
fi

# Fetch data from the API
# -s for silent, -f to fail silently on server errors
RESPONSE=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=${UNITS}")

# Check if the API call was successful
if [ $? -ne 0 ]; then
    echo "Error: Could not retrieve weather data. Is the city name '${CITY}' correct?"
    exit 1
fi

# Use jq to parse the JSON response and extract the data
# The `jq -r` flag outputs raw strings instead of JSON-quoted strings
WEATHER_DATA=$(echo "$RESPONSE" | jq -r \
    --arg unit_symbol "$UNIT_SYMBOL" \
    --arg speed_unit "$SPEED_UNIT" \
    '. | 
    {
        name: .name,
        country: .sys.country,
        description: .weather[0].description,
        temp: .main.temp,
        feels_like: .main.feels_like,
        humidity: .main.humidity,
        wind_speed: .wind.speed
    } |
    "Weather in \(.name), \(.country):\n" +
    "---------------------------------\n" +
    "Condition:   \(.description | sub("."; " "; "g") | sub(.[0]; .[0] | ascii_upcase))\n" +
    "Temperature: \(.temp | round)\($unit_symbol)\n" +
    "Feels like:  \(.feels_like | round)\($unit_symbol)\n" +
    "Humidity:    \(.humidity)%\n" +
    "Wind Speed:  \(.wind_speed) \($speed_unit)"
')

# Print the final formatted output
echo -e "$WEATHER_DATA"



### How to Use

# Save the Code:
#		Save it to a file named weather-api.sh.

# Edit the Script:
#		Open weather-api.sh and paste API key into the API_KEY="" variable. You can also change
#		the DEFAULT_CITY and UNITS.

# Make it Executable:
#chmod +x weather-api.sh

Run it:

For your default city:

Generated bash
./weather-api.sh
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
Bash
IGNORE_WHEN_COPYING_END

For a specific city:

Generated bash
./weather-api.sh "Los Angeles"
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
Bash
IGNORE_WHEN_COPYING_END

This will produce a clean, text-based report like this:

Generated code
Weather in London, GB:
---------------------------------
Condition:   Overcast clouds
Temperature: 14°C
Feels like:  13°C
Humidity:    81%
Wind Speed:  3.09 m/s
IGNORE_WHEN_COPYING_START
content_copy
download
Use code with caution.
IGNORE_WHEN_COPYING_END
Choosing the Right Script

For a quick, easy, and visually rich solution with zero setup, use Option 1 (wttr.in). It's perfect for most users.

For a more robust, customizable, and script-friendly solution that you can integrate into other programs, use Option 2 (OpenWeatherMap API). It's a great learning exercise in Bash scripting, API usage, and jq.