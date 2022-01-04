
all: install

backup:
	mv ~/.bashrc ~/.bashrc.bak || true
	mv ~/.zshrc ~/.zshrc.bak || true
	mv ~/.vimrc ~/.vimrc.bak || true
	mv ~/.vim ~/.vim.bak || true
	mv ~/.subbash ~/.subbash.bak || true
	mv ~/.tmux.conf ~/.tmux.conf.bak || true
	mv ~/.gitconfig ~/.gitconfig.bak || true
	mv ~/.gitignore ~/.gitignore.bak || true

install:
	ln -s $(PWD)/.subbash ~ || true
	ln -s $(PWD)/.bashrc ~ || true
	ln -s $(PWD)/.zshrc ~ || true
	ln -s $(PWD)/.tmux.conf ~ || true

vim:
	ln -s $(PWD)/.vim ~ && \
	ln -s $(PWD)/.vim/.vimrc ~ && \
	mkdir -p ~/.config/nvim && \
	ln -s $(PWD)/.vim/.vimrc ~/.config/nvim/init.vim && \
	git clone https://github.com/VundleVim/Vundle.vim.git $(PWD)/.vim/bundle/Vundle.vim && \
	vim +PluginInstall +qall

clean:
	rm -rf .ssh doc etc img README.md

ssh:
	echo -e "\n" >> ~/.ssh/config && cat .ssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/.gitconfig ~ || true
	ln -s $(PWD)/.gitignore ~ || true

completion:
	sudo mkdir -p /etc/bash_completion.d && \
	sudo ln -s $(PWD)/etc/bash_completion.d/all /etc/bash_completion.d
