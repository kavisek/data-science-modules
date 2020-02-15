startvalue=1
stopvalue=99
while [ "$startvalue" -le "$stopvalue" ];
do echo $startvalue;
startvalue=$((startvalue + 1))
done;
