
all: bash

backup:
	mv ~/.bashrc ~/.bashrc.bak || true
	mv ~/.zshrc ~/.zshrc.bak || true
	mv ~/.vimrc ~/.vimrc.bak || true
	mv ~/.vim ~/.vim.bak || true
	mv ~/.subbash ~/.subbash.bak || true
	mv ~/.subzsh ~/.subzsh.bak || true
	mv ~/.tmux.conf ~/.tmux.conf.bak || true
	mv ~/.gitconfig ~/.gitconfig.bak || true
	mv ~/.gitignore ~/.gitignore.bak || true

bash:
	test -d ~/.subbash || \
	ln -s $(PWD)/sub/bash ~/.subbash
	ln -s ~/.subbash/bashrc ~/.bashrc

zsh:
	test -d ~/.subzsh || \
	ln -s $(PWD)/sub/zsh ~/.subzsh
	ln -s ~/.subzsh/zshrc ~/.zshrc
	mkdir ~/.subzsh/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.subzsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.subzsh/plugins/zsh-syntax-highlighting

tmux:
	ln -s $(PWD)/sub/tmux/tmux.conf ~/.tmux.conf

alacritty:
	test -d ~/.config/alacritty || \
	mkdir -p ~/.config/alacritty
	ln -s $(PWD)/sub/alacritty/alacritty.yml ~/.config/alacritty/

vim:
	echo "sudo pacman -S npm; sudo npm install pyright"
	echo "set editing-mode vi" >> ~/.inputrc
	test -d ~/.vim || \
	ln -s $(PWD)/sub/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	mkdir -p ~/.config/nvim
	ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

ssh:
	cat $(PWD)/sub/ssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/sub/git/gitconfig ~/.gitconfig
	ln -s $(PWD)/sub/git/gitignore ~/.gitignore

ranger:
	echo "sudo pacman -S highlight ttf-joypixels noto-fonts-emoji ueberzug"
	test -d ~/.config/ranger || \
	mkdir -p ~/.config/ranger
	ln -s $(PWD)/sub/ranger/rc.conf ~/.config/ranger
	mkdir -p ~/.config/ranger/plugins
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
	ranger --copy-config=all

gpg:
	test -d ~/.gnupg || \
	mkdir -p ~/.gnupg
	cat $(PWD)/sub/gpg/gpg.conf >> ~/.gnupg/gpg.conf
	echo -e "default-cache-ttl 1\nmax-cache-ttl 1" > ~/.gnupg/gpg-agent.conf; echo RELOADAGENT | gpg-connect-agent

