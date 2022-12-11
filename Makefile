
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
	git clone https://github.com/hlissner/zsh-autopair ~/.subzsh/plugins/hlissner/zsh-autopair
	git clone https://github.com/unixorn/fzf-zsh-plugin.git ~/.subzsh/plugins/unixorn/fzf-zsh-plugin && \
	ln -s ~/.subzsh/plugins/unixorn/fzf-zsh-plugin/bin/* ~/.local/bin/

tmux:
	ln -s $(PWD)/sub/tmux/tmux.conf ~/.tmux.conf

alacritty:
	test -d ~/.config/alacritty || \
	mkdir -p ~/.config/alacritty
	ln -s $(PWD)/sub/alacritty/alacritty.yml ~/.config/alacritty/

vim:
	@echo "sudo pacman -S npm ctags fzf glow; mkdir ~/.npm-global; npm config set prefix '~/.npm-global'; npm install -g pyright"
	echo "set editing-mode vi" >> ~/.inputrc
	test -d ~/.vim || \
	ln -s $(PWD)/sub/vim ~/.vim
	ln -s $(PWD)/light/.vimrc ~/.vimrc
	mkdir -p ~/.config/nvim/lua
	ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
	ln -s $(PWD)/sub/vim/init.lua ~/.config/nvim/lua/init.lua
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	nvim +PluginInstall +qall

ssh:
	cat $(PWD)/sub/ssh/config >> ~/.ssh/config

git:
	ln -s $(PWD)/sub/git/gitconfig ~/.gitconfig
	ln -s $(PWD)/sub/git/gitignore ~/.gitignore
	ln -s $(PWD)/sub/git/hooks ~/.githooks

ranger:
	@echo "sudo pacman -S highlight ttf-joypixels noto-fonts-emoji ueberzug poppler"
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

i3:
	@echo "sudo pacman -S nitrogen picom compton ttf-font-awesome xdotool xclip maim"
	test -d ~/.config/i3 || \
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/i3status
	ln -s $(PWD)/sub/i3/config ~/.config/i3/config
	ln -s $(PWD)/sub/i3/statusconfig ~/.config/i3status/config

bat:
	test -d ~/.config/bat || \
	mkdir -p ~/.config/bat
	ln -s $(PWD)/sub/bat/config ~/.config/bat/config

ipython:
	test -d ~/.ipython || \
	mkdir -p ~/.ipython/profile_default
	ln -s $(PWD)/sub/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py

font:
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts
	wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
	unzip FiraCode.zip -d ~/.local/share/fonts
	git clone 'https://github.com/powerline/fonts.git' --depth=1
	cd fonts
	./install.sh

termux:
	@echo "apt install termux-api tsu"

arch:
	@echo 'echo "ParallelDownloads = 5" >> /etc/pacman.conf'

psql:
	ln -s $(PWD)/sub/psql/psqlrc ~/.psqlrc
