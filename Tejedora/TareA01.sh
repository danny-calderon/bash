#!/bin/bash

if [ $1 = "humano" ]; then

	rm /boot/grub/grub.cfg

	mv grub-humano.cfg /boot/grub

	mv /boot/grub/grub-humano.cfg /boot/grub/grub.cfg



elif [ $1 = "humano" ]; then

	rm /boot/grub/grub.cfg

	mv grub-lobo.cfg /boot/grub

	mv /boot/grub/grub-lobo.cfg /boot/grub/grub.cfg

fi

exit 0
