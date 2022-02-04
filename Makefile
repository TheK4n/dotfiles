
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
	test -e ~/.subbash || \
	ln -s $(PWD)/subbash ~/.subbash
	ln -s $(PWD)/bashrc ~/.bashrc

zsh:
	test -e ~/.subzsh || \
	ln -s $(PWD)/subzsh ~/.subzsh
	ln -s $(PWD)/zshrc ~/.zshrc
	mkdir ~/.subzsh/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.subzsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.subzsh/plugins/zsh-syntax-highlighting


tmux:
	ln -s $(PWD)/subtmux/tmux.conf ~/.tmux.conf

vim:
	test -e ~/.vim || \
	ln -s $(PWD)/subvim ~/.vim
	ln -s $(PWD)/subvim/.vimrc ~/.vimrc
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/subvim/.vimrc ~/.config/nvim/init.vim
	git clone https://github.com/VundleVim/Vundle.vim.git $(PWD)/subvim/bundle/Vundle.vim
	vim +PluginInstall +qall

ssh:
	cat $(PWD)/subssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/subgit/gitconfig ~/.gitconfig
	ln -s $(PWD)/subgit/gitignore ~/.gitignore

ranger:
	test -e ~/.config/ranger || \
	mkdir -p ~/.config/ranger
	ln -s $(PWD)/subranger/rc.conf ~/.config/ranger
	mkdir -p ~/.config/ranger/plugins
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

