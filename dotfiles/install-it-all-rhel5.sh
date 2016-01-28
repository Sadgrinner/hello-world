#!/bin/bash

# curl https://raw.githubusercontent.com/Sadgrinner/hello-world/master/dotfiles/install-it-all-rhel5.sh -o ~/install-it-all-rhel5.sh
# to change the parent shell, use `source ~/install-it-all-rhel5.sh`
# See http://stackoverflow.com/questions/13753157/bash-script-to-change-parent-shell-directory

successfully() {
	$* || (echo -e "\nfailed" 1>&2 && exit 1)
}

fancy_echo() {
	echo -e "\n$1"
}

check_package() {
	fancy_echo "Checking $1 installation"
	yum list installed $1 >/dev/null 2>&1 || {
			fancy_echo "Installing $1"
			successfully sudo yum install $1
	}
}

check_command() {
	fancy_echo "Checking $1 installation"
	command -v $1 > /dev/null 2>&1 || {
			fancy_echo "Installing $1 (this can be a very slow process - let it finish)"
			successfully sudo yum install $1
	}
}

fancy_echo "Checking ~/.vim/undodir and ~/.vim/backupdir"
mkdir -m 700 -p ~/.vim/undodir
mkdir -m 700 -p ~/.vim/backupdir

fancy_echo "Updating yum package library"
successfully sudo yum check-update

check_command zsh
sudo chmod a+x /usr/bin/chsh
fancy_echo "Changing shells to zsh"
chsh -s `which zsh`   # note, you should see your zsh installation in the file '/etc/shells'

check_package flex-2.5.4a-41.fc6.x86_64
check_package automake-1.9.6-3.0.el5amzn.noarch
check_package autotools-dev
check_package libltdl-dev
check_package libtool-1.5.22-7.el5_4.x86_64
check_package autoconf

fancy_echo "Installing oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ] ; then
	fancy_echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#
# assumes that git is already installed
#

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

#
# assumes that the aws cli is already installed
#

fancy_echo "Checking the_silver_searcher (ag) installation"
command -v ag > /dev/null 2>&1 || {
	fancy_echo "Installing the_silver_searcher (ag)"
	successfully git clone https://github.com/ggreer/the_silver_searcher $HOME/ag
	successfully pushd $HOME/ag
	successfully ./build.sh
	successfully sudo make install
	successfully cd $HOME
	successfully sudo rm -rf $HOME/ag
	successfully popd
}

fancy_echo "Updating gitconfig"
	successfully git config --global github.user "Sadgrinner"
	successfully git config --global user.name "Sadgrinner"
	successfully git config --global user.email "Sadgrinner@users.noreply.github.com"
	successfully git config --global core.excludesfile "~/.gitignore"
#	successfully git config --global github.token TOKEN
