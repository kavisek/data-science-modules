startvalue=1
stopvalue=100
for((i=$startvalue;i<=$stopvalue;++i)) do
  if [ $((i%2)) -eq 1 ]
    then echo $i
  fi
done
