
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
	ln -s $(PWD)/.subbash ~ || true
	ln -s $(PWD)/.bashrc ~ || true

zsh:
	ln -s $(PWD)/.subzsh ~ || true
	ln -s $(PWD)/.zshrc ~ || true

tmux:
	ln -s $(PWD)/.tmux.conf ~ || true

vim:
	ln -s $(PWD)/.vim ~ && \
	ln -s $(PWD)/.vim/.vimrc ~ && \
	mkdir -p ~/.config/nvim && \
	ln -s $(PWD)/.vim/.vimrc ~/.config/nvim/init.vim && \
	git clone https://github.com/VundleVim/Vundle.vim.git $(PWD)/.vim/bundle/Vundle.vim && \
	vim +PluginInstall +qall

ssh:
	echo -e "\n" >> ~/.ssh/config && cat .ssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/.gitconfig ~ || true
	ln -s $(PWD)/.gitignore ~ || true

completion:
	sudo mkdir -p /etc/bash_completion.d && \
	sudo ln -s $(PWD)/etc/bash_completion.d/all /etc/bash_completion.d

ranger:
	mkdir -p ~/.config/ranger || true
	ln -s $(PWD)/.ranger/rc.conf ~/.config/ranger || true
	mkdir -p ~/.config/ranger/plugins && \
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

