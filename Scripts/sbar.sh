#!/usr/bin/bash



fdate(){
    date +"%H:%M"
}


cmus(){
artist=$(echo -n $(cmus-remote -C 'format_print %F'))

if [[ $artist = *[!\ ]* ]]; then
#        song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
        position=$(cmus-remote -C status | grep position | cut -c 10-)
        minutes1=$(prepend_zero $(($position / 60)))
        seconds1=$(prepend_zero $(($position % 60)))
        duration=$(cmus-remote -C status | grep duration | cut -c 10-)
        minutes2=$(prepend_zero $(($duration / 60)))
        seconds2=$(prepend_zero $(($duration % 60)))
        echo -n "󰎆 $artist"
else
        echo
fi

}
UsdTorub(){
        rate=$(python3 /home/bbclbtq/Python/RublesCourse/rub.py)
        printf "%s" "USD - $rate "
}

mem(){
memTotal="$(free -h | grep Mem: |awk '{printf$2}')"
memUsed="$(free -h | grep Mem: | awk '{printf$3}')"
icon=" "
#printf " ^c#e4b371^ %s %s \\n" "$icon""$mem"
printf "%s %s \\n" "$icon""Memory: ""$memUsed""/""$memTotal"
}


cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  icon=" "
#  printf " ^c#7ca198^ %s %s \\n" "$icon""$cpu%"
  printf "%s %s" "$icon""CPU: ""$cpu%"
}

vol(){
vol="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{printf$5}')"
icon=" "
printf "%s" "$icon""Volume: ""$vol"
}

generate_content(){
        echo "  $(UsdTorub)| $(cpu)| $(mem)| $(cmus)| $(vol) | Time $(fdate)"
}


while true; do
    xsetroot -name "$(generate_content)"
    sleep 0.025
done
