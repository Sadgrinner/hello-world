#!/bin/zsh

#  curl https://raw.githubusercontent.com/Sadgrinner/hello-world/master/dotfiles/install-it-all.sh -o ~/install-it-all.sh

successfully() {
	$* || (echo "\nfailed" 1>&2 && exit 1)
}

fancy_echo() {
	echo "\n$1"
}

fancy_echo "Checking ~/.vim/undodir and ~/.vim/backupdir"
mkdir -m 700 -p ~/.vim/undodir
mkdir -m 700 -p ~/.vim/backupdir

fancy_echo "Checking git installation"
command -v git > /dev/null 2>&1 || {
	fancy_echo "Updating git (this can be a very slow process - let it finish)"
	successfully pact update git
}

fancy_echo "Checking python installation"
command -v python > /dev/null 2>&1 || {
	fancy_echo "Updating python (this can be a very slow process - let it finish)"
	successfully pact update python
}

fancy_echo "Checking pip installation"
command -v pip > /dev/null 2>&1 || {
	fancy_echo "Installing pip"
	successfully curl -O https://bootstrap.pypa.io/get-pip.py
	successfully sudo python2.7 get-pip.py
}
fancy_echo "Checking aws cli installation"
command -v aws > /dev/null 2>&1 || {
	fancy_echo "Installing the awscli"
	successfully pip install awscli
}

fancy_echo "Checking the_silver_searcher (ag) installation"
command -v ag > /dev/null 2>&1 || {
	fancy_echo "Installing the_silver_searcher (ag)"
	successfully pact install automake pkg-config libpcre-devel liblzma-devel
	successfully git clone https://github.com/ggreer/the_silver_searcher ~/ag
	successfully pushd ~/ag
	successfully bash -x -o igncr ./build.sh && make install
	successfully cd ..
	successfully rm -rf ~/ag
	successfully popd
}

fancy_echo "Updating gitconfig"
	successfully git config --global github.user "Sadgrinner"
	successfully git config --global user.name "Sadgrinner"
	successfully git config --global user.email "Sadgrinner@users.noreply.github.com"
	successfully git config --global core.excludesfile "~/.gitignore"
#	successfully git config --global github.token TOKEN
