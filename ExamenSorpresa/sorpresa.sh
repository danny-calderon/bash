#!/bin/bash


tiempo=$(echo ps -ex | awk '{print $4}' | cut -d ":" -f2 | grep -v "TIME")

for loop in $tiempo; do

	hours=$(echo $tiempo | cut -d ":" -f1 | bc)

	minutes=$(echo $tiempo | cut -d ":" -f2 | bc)

	let hora=hours+hora

	let minutos=minutes+minutos

	if [ $minutos -ge 60 ]; then

		let minutos=minutos-60
		let hora=hora+1

	fi

done

echo "$hora:$minutos"

exit 0
