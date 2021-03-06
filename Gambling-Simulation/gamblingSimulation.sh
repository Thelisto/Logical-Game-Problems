#!/bin/bash -x

stake=100;
winDay=0;
lossDay=0;

declare -A perDayStakeAmount
for ((days=1; days<=20; days++))
do
   lowestLost=50;
	highestWin=150;
	while [[ $stake -gt $lowestLost && $stake -lt $highestWin ]]
   do
		gamble=$(( RANDOM % 2 ))
      if [ $gamble = 1 ]
      then
       	stake=$(($stake + 1));
			winDay=$(($winDay + 1));
      else
        	stake=$(($stake - 1));
			lossDay=$(($lossDay + 1))
      fi 
		
	done
	
	winDayResult[$days]=$winDay;
	lossDayResult[$days]=$lossDay;
	totalAmount=$(($totalAmount + $stake))
	perDayStakeAmount["stake"]=$totalAmount
done

echo "\nNumber of Days won : $winDay"
echo "\nNumber of Days lost: $lossDay"

if [ $winDayResult -gt $lossDayResult ] 
then
	echo "you can play next month\n"
else
	echo "you should not play next month\n"
fi

