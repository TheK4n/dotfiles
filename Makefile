
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
	ln -s $(PWD)/.vim ~
	ln -s $(PWD)/.vim/.vimrc ~
	git clone https://github.com/VundleVim/Vundle.vim.git $(PWD)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

clean:
	rm -rf .ssh doc etc scripts img .gitignore README.md .git

ssh:
	echo -e "\n" >> ~/.ssh/config
	cat .ssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/.gitconfig ~ || true
	ln -s $(PWD)/.gitignore ~ || true

