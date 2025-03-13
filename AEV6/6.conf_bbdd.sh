#!/bin/bash

sudo mkdir /home/aev4/bbdd
sudo groupadd bbdd_rw
sudo groupadd bbdd_w

sudo usermod -aG bbdd_rw sergio
sudo usermod -aG bbdd_rw andrea
sudo usermod -aG bbdd_w ana
sudo usermod -aG bbdd_w julia

sudo chown :bbdd_rw /home/aev4/bbdd
sudo chmod 770 /home/aev4/bbdd
sudo setfacl -m g:bbdd_w:w /home/aev4/bbdd

exit 0
