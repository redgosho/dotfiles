#!/bin/sh

airport_path="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

if air_info=($(eval "$airport_path" -I | grep -E "^ *(agrCtlRSSI|state|SSID):" | awk '{print $2}')) ; then

  rssi=${air_info[0]}
  state=${air_info[1]}
  ssid=${air_info[2]}

  case "$state" in
    "running" )
      signals=(▁ ▂ ▄ ▆ █)
      signal=""
      rssi_=$(expr 5 - ${rssi} / -20)
      for ((i=0; i < $rssi_; i++ )); do
        signal="${signal}${signals[$i]}"
      done
      airport_="#[underscore]#[bold]${ssid}#[default]#[bg=colour51,fg=colour232]#[bold]|${signal}"
    ;;
    "init"    ) airport_="#[fg=yellow] ... " ;;
    *         ) airport_="#[fg=red] ✘  " ;;
  esac  
  echo "#[bold]#[bg=colour51,fg=colour232]|#${airport_}#[bold]|#[default]"
fi
