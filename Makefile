
all: install

install:
	ln -s $(PWD)/.subbash ~
	ln -s $(PWD)/.bashrc ~
	ln -s $(PWD)/.zshrc ~
	ln -s $(PWD)/.vimrc ~
	. ~/.bashrc

clean:
	rm -rf .ssh doc etc functions img .gitignore README.md setup.sh ssh_setup.sh git_setup.sh .git

ssh:
	touch ~/.ssh/config
	cat .ssh/config >> ~/.ssh/config