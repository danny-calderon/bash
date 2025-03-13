#!/bin/bash

for user in marta ana julia sergio andrea jorge ramon danny; do

	sudo touch /home/$user/diario.txt
	sudo chown $user:$user /home/$user/diario.txt
	sudo chmod 600 /home/$user/diario.txt
	sudo setfacl -m u:marta:r /home/$user/diario.txt

done

exit 0
