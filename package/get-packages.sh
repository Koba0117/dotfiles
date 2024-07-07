#!/bin/bash
PAC_PATH=~/dotfiles/package

pacman -Q >$PAC_PATH/packages.txt
pacman -Qqen >$PAC_PATH/offical-explicit-packages.txt
pacman -Qqem >$PAC_PATH/AUR-explicit-packages.txt
