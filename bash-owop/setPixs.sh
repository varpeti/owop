while read line; do
     xdotool mousemove $line;
     xdotool click 1
done < pos.txt