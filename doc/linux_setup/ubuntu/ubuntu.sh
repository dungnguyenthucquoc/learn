<<COMMENT
COMMENT

<<COMMENT
sudo su
nano /etc/sudoers
gyuho ALL=(ALL) NOPASSWD: ALL
COMMENT

sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y autoremove && sudo apt-get -y autoclean && \
sudo apt-get -y install build-essential && \
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y autoremove && sudo apt-get -y autoclean;

sudo apt-get -y install git  && \
sudo apt-get -y install curl wget && \
sudo apt-get -y install bash-completion && \
sudo apt-get -y install terminator && \
sudo apt-get -y install pcmanfm;

sudo apt-get -y install ntpdate;
sudo ntpdate ntp.ubuntu.com;

<<COMMENT
- Time & Date
- Language Support
- https://www.google.com/chrome
- Software Updater

sudo reboot;

- Keyboard
COMMENT

#############################################################
printf "\n\n\n\n\ninstalling git...\n\n" && sleep 1s;

sudo apt-get -y install git;

echo "[user]
  email = gyuhox@gmail.com
  name = Gyu-Ho Lee

[color]
  diff = auto
  status = auto
  branch = auto
  ui = auto" > $HOME/.gitconfig;

git config --global user.name "Gyu-Ho Lee";
git config --global user.email "gyuhox@gmail.com";
git config --global core.editor "vim";

cd $HOME && \
mkdir -p $HOME/go/src && \
mkdir -p $HOME/go/src/github.com && \
mkdir -p $HOME/go/src/github.com/coreos && \
mkdir -p $HOME/go/src/github.com/gyuho && \
mkdir -p $HOME/go/src/golang.org;

cd $HOME/go/src/github.com/gyuho && git clone https://github.com/gyuho/learn.git;
cd $HOME/go/src/github.com/coreos && git clone https://github.com/coreos/etcd.git;

#############################################################
printf "\n\n\n\n\ninstalling go(golang)...\n\n" && sleep 1s;

sudo apt-get -y install gccgo-go;
sudo apt-get -y remove gccgo;

cd $HOME && \
mkdir -p $HOME/go/src && \
mkdir -p $HOME/go/src/github.com && \
mkdir -p $HOME/go/src/github.com/coreos && \
mkdir -p $HOME/go/src/github.com/gyuho && \
mkdir -p $HOME/go/src/golang.org;

# install go 1.4
cd $HOME && sudo rm -rf go1.4 && \
cd $HOME && sudo rm -rf go1.4_temp && mkdir -p $HOME/go1.4_temp && \
sudo curl -s https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz | sudo tar -v -C $HOME/go1.4_temp -xz && \
cd $HOME/go1.4_temp && sudo mv ./go ./go1.4 && sudo mv ./go1.4 .. && \
cd $HOME && sudo rm -rf $HOME/go1.4_temp;

# install go tip
cd $HOME && rm -rf ./go-master && mkdir -p $HOME/go-master && \
cd $HOME/go-master && git clone https://go.googlesource.com/go && cd $HOME/go-master/go/src && ./all.bash;

# install latest go
GO_VERSION="1.5.3" && cd /usr/local && sudo rm -rf ./go && sudo curl -s https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz | sudo tar -v -C /usr/local/ -xz && cd $HOME;
echo "export GOPATH=$(echo $HOME)/go" >> $HOME/.bashrc
PATH_VAR=$PATH":/usr/local/go/bin:$(echo $HOME)/go/bin"
echo "export PATH=$(echo $PATH_VAR)" >> $HOME/.bashrc
export GOPATH=$(echo $HOME)/go
PATH_VAR=$PATH":/usr/local/go/bin:$(echo $HOME)/go/bin"
export PATH=$(echo $PATH_VAR)
go version

if grep -q GOPATH "$(echo $HOME)/.bashrc"; then 
	echo "bashrc already has GOPATH...";
else
	echo "adding GOPATH to bashrc...";
	echo "export GOPATH=$(echo $HOME)/go" >> $HOME/.bashrc && \
	PATH_VAR=$PATH":/usr/local/go/bin:$(echo $HOME)/go/bin" && \
	echo "export PATH=$(echo $PATH_VAR)" >> $HOME/.bashrc && \
	source $HOME/.bashrc;
fi

cd $HOME && \
printf "package main\n\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Println(\"Successfully installed Go.\")\n}" > $HOME/temp.go;
cd $HOME && go run temp.go && rm -f temp.go && go version;

cd $HOME && \
go get -v -u -f github.com/tools/godep && \
go get -v -u -f golang.org/x/tools/cmd/... && \
go get -v -u -f github.com/golang/lint/golint && \
go get -v -u -f github.com/nsf/gocode && \
go get -v -u -f github.com/motain/gocheck && \
go get -v -u -f github.com/vaughan0/go-ini && \
go get -v -u -f github.com/rogpeppe/godef && \
go get -v -u -f github.com/kisielk/errcheck && \
go get -v -u -f github.com/jstemmer/gotags && \
go get -v -u -f github.com/alecthomas/gometalinter && \
go get -v -u -f golang.org/x/tools/cmd/benchcmp && \
go get -v -u -f golang.org/x/tools/cmd/goimports && \
cd $GOPATH/src/github.com/nsf/gocode/vim && sudo ./update.sh && \
cd $HOME;

#############################################################
printf "\n\n\n\n\ninstalling vim...\n\n" && sleep 1s;

sudo apt-get -y install vim && \
sudo apt-get -y install vim-nox && \
sudo apt-get -y install vim-gtk && \
sudo apt-get -y install vim-gnome && \
sudo apt-get -y install vim-athena;

sudo chown -R gyuho:gyuho $HOME/.vim;
sudo mkdir -p $HOME/.vim/ftdetect;
sudo mkdir -p $HOME/.vim/syntax;
sudo chmod -R +x $HOME/.vim;

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

cd $HOME/go/src/github.com/gyuho/learn/doc/linux_setup;
sudo cp ./vimrc.vim $HOME/.vimrc;
source $HOME/.vimrc;

<<COMMENT
:PlugInstall
:PlugClean
:PlugUpdate
:PlugUpgrade
:GoInstallBinaries
COMMENT

#############################################################
printf "\n\n\n\n\ninstalling sublime...\n\n" && sleep 1s;

<<COMMENT
http://www.sublimetext.com/3
https://packagecontrol.io/installation
ctrl + `
ctrl + shift + p
install package
COMMENT

cp sublime_user_setting.json \	
	$HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

cp sublime_user_keymap.json \
	$HOME/.config/sublime-text-3/Packages/User/Default\	\(Linux\).sublime-keymap

cp sublime_user_terminal_setting.json \
	$HOME/.config/sublime-text-3/Packages/Terminal/Terminal.sublime-settings

cp sublime_user_gosublime_setting.json \
	$HOME/.config/sublime-text-3/Packages/User/GoSublime.sublime-settings

#############################################################
printf "\n\n\n\n\ninstalling others...\n\n" && sleep 1s;

sudo cp $HOME/go/src/github.com/gyuho/learn/doc/linux_setup/ubuntu_bashrc.sh $HOME/.bashrc && source $HOME/.bashrc;

sudo mkdir -p $HOME/.config/terminator;
# sudo nano $HOME/.config/terminator/config;
sudo cp $HOME/go/src/github.com/gyuho/learn/doc/linux_setup/ubuntu_terminator.conf $HOME/.config/terminator/config;
# cp $HOME/.config/terminator/config $HOME/go/src/github.com/gyuho/learn/doc/linux_setup/ubuntu_terminator.conf;

sudo apt-get -y install unzip gzip tar;
sudo apt-get -y install tree htop;
sudo apt-get -y install openssh;

sudo apt-get install -y python-pip python-dev build-essential;
sudo pip install --upgrade pip;

#############################################################
printf "\n\n\n\n\ninstalling protobuf...\n\n" && sleep 1s;

sudo apt-get -y install dh-autoreconf;

cd $HOME/go/src/github.com && rm -rf google/protobuf && mkdir google;
cd $HOME/go/src/github.com/google && git clone https://github.com/google/protobuf.git;
cd $HOME/go/src/github.com/google/protobuf && ./autogen.sh;
cd $HOME/go/src/github.com/google/protobuf && ./configure;
cd $HOME/go/src/github.com/google/protobuf && make;
cd $HOME/go/src/github.com/google/protobuf && make check;
cd $HOME/go/src/github.com/google/protobuf && make install;

#############################################################
printf "\n\n\n\n\ndone!\n\n\n\n\n"

# free pagecache, dentries, inodes / 1 for pagecache
# and the system starts caching immediately again
sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches;