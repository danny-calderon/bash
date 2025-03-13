#!/bin/bash

sudo mkdir /home/aev4/funcionalidad
sudo groupadd funcionalidad
sudo usermod -aG funcionalidad jorge
sudo usermod -aG funcionalidad ramon
sudo chown :funcionalidad /home/aev4/funcionalidad
sudo chmod 770 /home/aev4/funcionalidad

exit 0

