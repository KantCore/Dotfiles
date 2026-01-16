
date="$(date --iso-8601=minutes | grep -E -o '^[^+]+')"
time="$(date +%H)"
temp="$(curl --request GET --url 'https://api.brightsky.dev/weather?date='$date'&lat=[Your Lat]&lon=[Your Lon]' --header 'Accept: application/json' | sed 's/"temperature":/&\n/;s/.*\n//;s/,/\n&/;s/\n.*//')"
cloud="$(curl --request GET --url 'https://api.brightsky.dev/weather?date='$date'&lat=[Your Lat]&lon=[Your Lon]' --header 'Accept: application/json' | sed 's/"cloud_cover":/&\n/;s/.*\n//;s/,/\n&/;s/\n.*//')"

if awk "BEGIN { exit !($temp <= 0) }"; then
    echo "󱩱 : $temp°C"
fi

if awk "BEGIN { exit !($temp > 0) }" && awk "BEGIN { exit !($temp <= 6) }"; then
    echo " : $temp°C"
fi

if awk "BEGIN { exit !($temp > 6) }" && awk "BEGIN { exit !($temp <= 12) }"; then
    echo " : $temp°C"
fi

if awk "BEGIN { exit !($temp > 12) }" && awk "BEGIN { exit !($temp <= 18) }"; then
    echo " : $temp°C"
fi

if awk "BEGIN { exit !($temp > 18) }" && awk "BEGIN { exit !($temp <= 24) }"; then
    echo " : $temp°C"
fi

if awk "BEGIN { exit !($temp > 24) }" && awk "BEGIN { exit !($temp < 30) }"; then
    echo " : $temp°C"
fi
if awk "BEGIN { exit !($temp >= 30) }"; then
    echo " : $temp°C"
fi

echo " "

if [ "$cloud" -gt 75 ]; then
    echo "󰖐 : $cloud%"
fi

if [ "$cloud" -le 75 ] && [ "$cloud" -ge 35 ] && ([ "$time" -lt 19 ] && [ "$time" -gt 7 ]); then
    echo " : $cloud%"
fi

if [ "$cloud" -lt 35 ] && ([ "$time" -lt 19 ] && [ "$time" -gt 7 ]); then
    echo "󰖙 : $cloud%"
fi

if [ "$cloud" -le 75 ] && [ "$cloud" -ge 35 ] && ([ "$time" -ge 19 ] || [ "$time" -le 7 ]); then
    echo " : $cloud%"
fi

if [ "$cloud" -lt 35 ] && ([ "$time" -ge 19 ] || [ "$time" -le 7 ]); then
    echo " : $cloud%"
fi
