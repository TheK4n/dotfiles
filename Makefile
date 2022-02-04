
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
	ln -s $(PWD)/subbash ~/.subbash || true
	ln -s $(PWD)/bashrc ~/.bashrc || true

zsh:
	ln -s $(PWD)/subzsh ~/.subzsh || true
	ln -s $(PWD)/zshrc ~/.zshrc || true
	mkdir ~/.subzsh/plugins || true
	git clone https://github.com/zsh-users/zsh-autosuggestions $(PWD)/subzsh/plugins/zsh-autosuggestions || true
	git clone https://github.com/zsh-users/zsh-syntax-highlighting $(PWD)/subzsh/plugins/zsh-syntax-highlighting


tmux:
	ln -s $(PWD)/tmux.conf ~/.tmux.conf || true

vim:
	ln -s $(PWD)/subvim ~/.vim && \
	ln -s $(PWD)/subvim/.vimrc ~/.vimrc && \
	mkdir -p ~/.config/nvim && \
	ln -s $(PWD)/subvim/.vimrc ~/.config/nvim/init.vim && \
	git clone https://github.com/VundleVim/Vundle.vim.git $(PWD)/subvim/bundle/Vundle.vim && \
	vim +PluginInstall +qall

ssh:
	echo -e "\n" >> ~/.ssh/config && cat $(PWD)/subssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/subgit/.gitconfig ~ || true
	ln -s $(PWD)/.gitignore ~ || true

ranger:
	mkdir -p ~/.config/ranger || true
	ln -s $(PWD)/subranger/rc.conf ~/.config/ranger || true
	mkdir -p ~/.config/ranger/plugins || true
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

