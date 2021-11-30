
all: install

install:
	ln -s $(PWD)/.subbash ~
	ln -s $(PWD)/.bashrc ~
	ln -s $(PWD)/.zshrc ~
	ln -s $(PWD)/.vimrc ~

clean:
	rm -rf .ssh doc etc functions img .gitignore README.md setup.sh ssh_setup.sh git_setup.sh .git

ssh:
	cat .ssh/config >> ~/.ssh/config

git:
	git config --global user.email "djvlad967891@gmail.com"
	git config --global user.name "TheK4n"
	git config --global core.editor vim
	git config --global init.defaultBranch main
	git config --global core.autocrlf true
