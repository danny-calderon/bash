#!/bin/bash

sudo mkdir /home/aev4
sudo groupadd proyecto
sudo chown :proyecto /home/aev4
sudo chmod 770 /home/aev4
for user in marta ana julia sergio andrea jorge ramon danny; do

	sudo usermod -aG  proyecto $user

done

exit 0
