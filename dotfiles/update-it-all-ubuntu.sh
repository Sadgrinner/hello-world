#!/bin/zsh

# curl https://raw.githubusercontent.com/Sadgrinner/hello-world/master/dotfiles/update-it-all-ubuntu.sh -o ~/update-it-all-ubuntu.sh

successfully() {
	$* || (echo "\nfailed" 1>&2 && exit 1)
}

fancy_echo() {
	echo "\n$1"
}

upgrade_oh_my_zsh () {
	env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

update_package() {
	fancy_echo "Updating $1 (this can be a very slow update - let it finish)"
	successfully sudo apt-get upgrade $1
}

fancy_echo "Updating apt-get package library"
	successfully sudo apt-get update

fancy_echo "Updating oh-my-zsh"
	successfully upgrade_oh_my_zsh

update_package git-core
update_package automake/
update_package autotools-dev
update_package libltdl-dev
update_package libtool
update_package autoconf
update_package autopoint
update_package pkg-config
update_package libpcre3-dev
update_package zlib1g-dev
update_package liblzma-dev
update_package git
update_package python

fancy_echo "Updating pip"
	successfully python2.7 -m pip install --upgrade pip

fancy_echo "Updating the awscli"
	successfully pip install --upgrade awscli

