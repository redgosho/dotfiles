#!/bin/sh

# 参考:https://qiita.com/arks22/items/a792d9d43d913c373520

cap=`ioreg -l | grep Capacity`
full=`echo $cap | sed -e "s/^.*MaxCapacity\" = \([0-9]*\).*/\1/"`
curr=`echo $cap | sed -e "s/^.*CurrentCapacity\" = \([0-9]*\).*/\1/"`
pct=`echo "scale=3; $curr / $full * 100" | bc`

if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $2 " " $3 }' | sed -e "s/;//g" -e "s/%//") ; then
  # battery_quantity=$(echo $battery_info | awk '{print $1}')
  battery_quantity=$(printf "%.1f%%\n\n" $pct)
  if [[ ! $battery_info =~ "discharging" ]]; then
    battery="#[bg=black,fg=yellow] 雷$battery_quantity #[default]"
  elif (( $battery_quantity < 16 )); then
    battery="#[bg=red,fg=white] $battery_quantity #[default]"
  else
    battery="#[bg=black,fg=yellow] $battery_quantity #[default]"
  fi
  echo $battery
fi
