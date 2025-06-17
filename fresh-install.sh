#!/bin/bash

# Script made to be ran on Android in program 'UserLAnd' running a 'Debian' system.

sudo apt update

sudo apt upgrade

# Terminal
sudo apt install \
	tmux \
	htop \
	man \
	bash-completion

# GUI Desktop
sudo apt install \
	lxde
