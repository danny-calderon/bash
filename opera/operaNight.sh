#!/bin/bash

#Create groups

sudo groupadd strings
sudo groupadd woodwind
sudo groupadd metalwind
sudo groupadd percussion
sudo groupadd conductor
sudo groupadd orchestra

#Create users and a password and put them on the groups

useradd piccolo -m -g orchestra -G woodwind
echo "piccolo:123" | chpasswd
useradd clarinet -m -g orchestra -G woodwind
echo "clarinet:123" | chpasswd
useradd horn -m -g orchestra -G metalwind
echo "horn:123" | chpasswd
useradd trunk -m -g orchestra -G metalwind
echo "trunk:123" | chpasswd
useradd fiddle -m -g orchestra -G strings
echo "fiddle:123" | chpasswd
useradd viola -m -g orchestra -G strings
echo "viola:123" | chpasswd
useradd cello -m -g orchestra -G strings
echo "cello:123" | chpasswd
useradd doublebass -m -g orchestra -G strings
echo "doublebass:123" | chpasswd
useradd battery -m -g orchestra -G percussion
echo "battery:123" | chpasswd
useradd xylophone -m -g orchestra -G percussion
echo "xylophone:123" | chpasswd
useradd conductor -m -g orchestra -G conductor
echo "conductor:123" | chpasswd

exit 0
