#!/bin/zsh

# curl https://raw.githubusercontent.com/Sadgrinner/hello-world/master/dotfiles/install-it-all-babun.sh -o ~/install-it-all-babun.sh
# use `pact show` to get the list of installed packages
INSTALLED=$(pact show)

successfully() {
	$* || (echo "\nfailed" 1>&2 && exit 1)
}

fancy_echo() {
	echo "\n$1"
}

check_package() {
	fancy_echo "Checking $1 installation"
	echo $INSTALLED | grep -c $1 > /dev/null || {
			fancy_echo "Installing $1"
			successfully pact install $1
	}
}

check_command() {
	fancy_echo "Checking $1 installation"
	command -v $1 > /dev/null 2>&1 || {
			fancy_echo "Installing $1 (this can be a very slow process - let it finish)"
			successfully pact install $1
	}
}

fancy_echo "Checking ~/.vim/undodir and ~/.vim/backupdir"
mkdir -m 700 -p ~/.vim/undodir
mkdir -m 700 -p ~/.vim/backupdir

fancy_echo "Updating pact package library"
successfully pact update

#
# no need to check for zsh;
# no need to check for oh-my-zsh:
# babun comes with both already installed!
#

# check for and install dependencies needed for later installs:
check_package flex
check_package libtool
check_package automake
check_package pkg-config
check_package libpcre-devel
check_package liblzma-devel

check_command git

fancy_echo "Checking jq installation"
command -v jq > /dev/null 2>&1 || {
	fancy_echo "Installing jq"
	successfully git clone https://github.com/stedolan/jq.git
	successfully pushd jq
	successfully autoreconf -i
	successfully ./configure --disable-maintainer-mode
	successfully make
	successfully sudo make install
	successfully popd
}

check_command python

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
	successfully git clone https://github.com/ggreer/the_silver_searcher $HOME/ag
	successfully pushd $HOME/ag
	successfully bash -x -o igncr ./build.sh
	successfully sudo make install
	successfully cd $HOME
	successfully rm -rf $HOME/ag
	successfully popd
}

fancy_echo "Updating gitconfig"
	successfully git config --global github.user "Sadgrinner"
	successfully git config --global user.name "Sadgrinner"
	successfully git config --global user.email "Sadgrinner@users.noreply.github.com"
	successfully git config --global core.excludesfile "~/.gitignore"
#	successfully git config --global github.token TOKEN
