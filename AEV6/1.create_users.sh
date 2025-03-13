#!/bin/bash

for user in marta ana julia sergio andrea jorge ramon danny; do

	sudo useradd -m $user
	sudo chmod 700 /home/$user
done

exit 0
