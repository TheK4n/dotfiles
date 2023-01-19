#!/usr/bin/env bash

# The idea is to define "holder" modules in i3status config and then replace them

# In order to make this example work you need to add
# order += "tztime holder__headphones"
# and 
# tztime holder__headphones {
#        format = "holder__headphones"
# }
# in i3staus config 

# Don't forget that i3status config should contain:
# general {
#   output_format = i3bar
# }
#
# and i3 config should contain:
# bar {
#   status_command exec /path/to/this/script.sh
# }

# Make sure jq is installed

# You can easily add multiple custom modules using additional "holders"

function update_holder {

  local instance="$1"
  local replacement="$2"
  echo "$json_array" | jq --argjson arg_j "$replacement" "(.[] | (select(.instance==\"$instance\"))) |= \$arg_j" 
}

function remove_holder {

  local instance="$1"
  echo "$json_array" | jq "del(.[] | (select(.instance==\"$instance\")))"
}

function headphones {

  battery_status="$(bluetoothctl info 14:0A:29:0A:6A:2F | grep "Battery Percentage" | awk -F '[()]' '{ print "🎧"$2"%" }')"

  local json="{ \"full_text\": \"$battery_status\", \"color\": \"#FFFFFF\"}"

  json_array=$(update_holder holder__headphones "$json")

}

i3status | (read line; echo "$line"; read line ; echo "$line" ; read line ; echo "$line" ; while true
do
  read line
  json_array="$(echo $line | sed -e 's/^,//')"
  headphones
  echo ",$json_array" 
done)
