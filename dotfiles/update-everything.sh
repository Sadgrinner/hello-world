#!/bin/zsh

# curl https://raw.githubusercontent.com/Sadgrinner/hello-world/master/dotfiles/update-everything.sh -o ~/update-everything.sh

successfully() {
	$* || (echo "\nfailed" 1>&2 && exit 1)
}

fancy_echo() {
	echo "\n$1"
}

upgrade_oh_my_zsh () {
	env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

fancy_echo "Updating pact"
	successfully pact update

fancy_echo "Updating babun"
	successfully babun update

fancy_echo "Updating oh-my-zsh"
	successfully upgrade_oh_my_zsh

#fancy_echo "Updating git (this can be a very slow update - let it finish)"
#	successfully pact update git

#fancy_echo "Updating python (this can be a very slow update - let it finish")
#	successfully pact update python

fancy_echo "Updating pip"
	successfully python2.7 -m pip install --upgrade pip

fancy_echo "Updating the awscli"
	successfully pip install --upgrade awscli

