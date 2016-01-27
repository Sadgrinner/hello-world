#!/bin/zsh

# curl https://raw.githubusercontent.com/Sadgrinner/hello-world/master/dotfiles/update-it-all-babun.sh -o ~/update-it-all-babun.sh

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
	successfully pact update $1
}

fancy_echo "Updating pact package library"
	successfully pact update

fancy_echo "Updating oh-my-zsh"
	successfully upgrade_oh_my_zsh

fancy_echo "Updating babun"
	successfully babun update

# Babun can be VERY slow when updating all of these (especially git and python) - be patient!
update_package flex
update_package libtool
update_package automake
update_package pkg-config
update_package libpcre-devel
update_package liblzma-devel
update_package git
update_package python
#

fancy_echo "Updating pip"
	successfully python2.7 -m pip install --upgrade pip

fancy_echo "Updating the awscli"
	successfully pip install --upgrade awscli

