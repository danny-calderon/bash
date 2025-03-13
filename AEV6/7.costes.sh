#!/bin/bash

sudo mkdir /home/aev4/costes
sudo groupadd costes_rw
sudo groupadd costes_r

sudo usermod -aG costes_rw ana
sudo usermod -aG costes_rw sergio
sudo usermod -aG costes_r julia
sudo usermod -aG costes_r andrea

sudo chown :costes_rw /home/aev4/costes
sudo chmod 770 /home/aev4/costes
sudo setfacl -m g:costes_r:r /home/aev4/costes

exit 0
