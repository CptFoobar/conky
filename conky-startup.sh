sleep 5s
killall conky
exec conky -d --config="/home/trinetra/.conky/Tiger_Wall/conky_rc" &
exec conky -d --config="/home/trinetra/.conky/conky_cal" &
exec conky -d --config="/home/trinetra/.conky/conky_datacheck" & 

fi
