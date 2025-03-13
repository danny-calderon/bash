#!/bin/bash

sudo mkdir /home/aev4/interfaz
sudo groupadd interfaz_rw
sudo groupadd interfaz_r

sudo usermod -aG interfaz_rw ana
sudo usermod -aG interfaz_rw julia
sudo usermod -aG interfaz_r sergio
sudo usermod -aG interfaz_r andrea

sudo chown :interfaz_rw /home/aev4/interfaz
sudo chmod 770 /home/aev4/interfaz
sudo setfacl -m g:interfaz_r:rx /home/aev4/interfaz

exit 0
