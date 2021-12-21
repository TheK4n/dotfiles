
all: install

install:
	ln -s $(PWD)/.subbash ~
	ln -s $(PWD)/.bashrc ~
	ln -s $(PWD)/.zshrc ~

vim:
	ln -s $(PWD)/.vim ~
	ln -s $(PWD)/.vim/.vimrc ~
	git clone https://github.com/VundleVim/Vundle.vim.git $(PWD)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

clean:
	rm -rf .ssh doc etc scripts img .gitignore README.md .git

ssh:
	cat .ssh/config >> ~/.ssh/config

git:
	git config --global user.email "djvlad967891@gmail.com"
	git config --global user.name "TheK4n"
	git config --global core.editor vim
	git config --global init.defaultBranch main
	git config --global core.autocrlf true
