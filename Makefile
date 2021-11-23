all: install

install:
	ln -s "$PWD"/dotfiles/.subbash ~
	ln -s "$PWD"/dotfiles/.bashrc ~
	ln -s "$PWD"/dotfiles/.zshrc ~
	ln -s "$PWD"/dotfiles/.vimrc ~

clean:
	rm -r .ssh doc etc functions img .gitignore README.md setup.sh ssh_setup.sh git_setup.sh .git

uninstall:
	rm -r ~/.subbash
