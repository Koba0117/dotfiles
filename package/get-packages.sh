#!/usr/bin/bash
pacman -Q >packages.txt
pacman -Qqen >offical-explicit-packages.txt
pacman -Qqem >AUR-explicit-packages.txt
