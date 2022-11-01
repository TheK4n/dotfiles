SUB="$(pwd)/sub"


_die() {
    echo "$1" >&2
    exit $2
}


_die_if_installed() {
    if [ -e "$1" ]; then
        _die "Already installed" 1
    fi
}

cmd_backup() {
	mv ~/.bashrc ~/.bashrc.bak
	mv ~/.zshrc ~/.zshrc.bak
	mv ~/.vimrc ~/.vimrc.bak
	mv ~/.vim ~/.vim.bak
	mv ~/.subbash ~/.subbash.bak
	mv ~/.subzsh ~/.subzsh.bak
	mv ~/.tmux.conf ~/.tmux.conf.bak
	mv ~/.gitconfig ~/.gitconfig.bak
	mv ~/.gitignore ~/.gitignore.bak
}

cmd_bash() {
    _die_if_installed "~/.subbash"

    ln -s "$SUB"/bash ~/.subbash
    ln -s ~/.subbash/bashrc ~/.bashrc
}

cmd_zsh() {
    local subzsh
    subzsh="$HOME/.subzsh"
    _die_if_installed "$subzsh"

    ln -s "$SUB"/zsh "$subzsh"
    ln -s "$subzsh"/zshrc ~/.zshrc
    mkdir "$subzsh"/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions     "$subzsh"/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$subzsh"/plugins/zsh-syntax-highlighting
    git clone https://github.com/hlissner/zsh-autopair             "$subzsh"/plugins/hlissner/zsh-autopair
    git clone https://github.com/unixorn/fzf-zsh-plugin.git        "$subzsh"/plugins/unixorn/fzf-zsh-plugin && \
        ln -s ~/.subzsh/plugins/unixorn/fzf-zsh-plugin/bin/* ~/.local/bin/
}

cmd_tmux() {
	ln -s "$SUB"/tmux/tmux.conf ~/.tmux.conf
}

cmd_alacritty() {
    _die_if_installed "~/.config/alacritty"

    mkdir -p ~/.config/alacritty
    ln -s "$SUB"/alacritty/alacritty.yml ~/.config/alacritty/
}

cmd_vim() {
	echo "sudo pacman -S npm ctags fzf glow; mkdir ~/.npm-global; npm config set prefix '~/.npm-global'; npm install -g pyright"

    local subvim
    subvim="$HOME/.vim"

    _die_if_installed "$subvim"

	echo "set editing-mode vi" >> ~/.inputrc
    ln -s "$SUB"/vim "$subvim"
    ln -s $(PWD)/light/.vimrc ~/.vimrc

    mkdir -p ~/.config/nvim/lua
    ln -s "$subvim"/vimrc     ~/.config/nvim/init.vim
    ln -s "$SUB"/vim/init.lua ~/.config/nvim/lua/init.lua

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    nvim +PluginInstall +qall
}

cmd_ssh() {
	cat "$SUB"/ssh/config >> ~/.ssh/config
}

cmd_git() {
	ln -s "$SUB"/git/gitconfig ~/.gitconfig
	ln -s "$SUB"/git/gitignore ~/.gitignore
	ln -s "$SUB"/git/hooks ~/.githooks
}

cmd_ranger() {
	echo "sudo pacman -S highlight ttf-joypixels noto-fonts-emoji ueberzug poppler"

    local subranger
    subranger="$HOME/.config/ranger"
	_die_if_installed "$subranger"

    
    mkdir -p "$subranger"
    ln -s "$SUB"/ranger/rc.conf "$subranger"
    mkdir -p "$subranger"/plugins
    git clone https://github.com/alexanderjeurissen/ranger_devicons "$subranger"/plugins/ranger_devicons
    ranger --copy-config=all
}

cmd_gpg() {
    local subgpg
    subgpg="$HOME/.gnupg"

	_die_if_installed "$subgpg"

    mkdir -p "$subgpg"
    cat "$SUB"/gpg/gpg.conf >> "$subgpg"/gpg.conf
    echo -e "default-cache-ttl 1\nmax-cache-ttl 1" > "$subgpg"/gpg-agent.conf; echo RELOADAGENT | gpg-connect-agent
}

cmd_i3() {
	echo "sudo pacman -S nitrogen picom compton ttf-font-awesome xdotool xclip maim"

    local subi3 subi3status
    subi3="$HOME/.config/i3"
    subi3status="$HOME/.config/i3status"
	_die_if_installed "$subi3"
	_die_if_installed "$subi3status"

    mkdir -p "$subi3"
    mkdir -p "$subi3status"
    ln -s "$SUB"/i3/config "$subi3"/config
    ln -s "$SUB"/i3/statusconfig "$subi3status"/config
}

cmd_bat() {
    local subbat
    subbat="$HOME/.config/bat"
    
	_die_if_installed "$subbat"

    mkdir -p "$subbat"
    ln -s "$SUB"/bat/config "$subbat"/config
}

cmd_ipython() {
    local subipython
    subipython="$HOME/.ipython"

	_die_if_installed "$subipython"

    mkdir -p "$subipython"/profile_default
    ln -s "$SUB"/ipython/ipython_config.py "$subipython"/profile_default/ipython_config.py
}

cmd_font() {
    local subfont
    subfont="$HOME/.local/share/fonts"

	mkdir -p "$subfont"
	cd "$subfont"
	wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
	unzip FiraCode.zip -d "$subfont"
	git clone 'https://github.com/powerline/fonts.git' --depth=1
	cd fonts
	./install.sh
}

cmd_termux() {
	echo "apt install termux-api tsu"
}

cmd_arch() {
	echo 'echo "ParallelDownloads = 5" >> /etc/pacman.conf'
}

cmd_unlink() {
#####################################################
}

cmd_install_functions() {
    for func in $(find functions -type f -maxdepth 1)
    do
        chmod 755 "$func"
        ln -s "$func" "$HOME/.local/bin"
    done
}

cmd_install() {
    case "$1" in
        bash) shift;           cmd_bash    "$@" ;;
        zsh) shift;            cmd_zsh    "$@" ;;
        tmux) shift;           cmd_tmux    "$@" ;;
        alacritty) shift;      cmd_alacritty    "$@" ;;
        vim) shift;            cmd_vim    "$@" ;;
        ssh) shift;            cmd_ssh    "$@" ;;
        git) shift;            cmd_git    "$@" ;;
        ranger) shift;         cmd_ranger    "$@" ;;
        gpg) shift;            cmd_gpg    "$@" ;;
        i3) shift;             cmd_i3    "$@" ;;
        bat) shift;            cmd_bat    "$@" ;;
        font) shift;           cmd_font    "$@" ;;
        termux) shift;         cmd_termux    "$@" ;;
        arch) shift;           cmd_arch    "$@" ;;
    esac
}


case "$1" in
    install) shift;              cmd_install    "$@" ;;
    unlink) shift;               cmd_unlink    "$@" ;;
esac
exit 0

