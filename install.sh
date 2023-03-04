#!/bin/bash


SUB="$(pwd)/home/user/"


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
    local sub=".subbash"
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
    ln -s "$SUB/.bashrc" "$HOME/.bashrc"
}

cmd_zsh() {
    local sub=".subzsh"
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
    ln -s "$SUB/.zshrc" "$HOME/.zshrc"
    ln -s "$SUB/.zfunc" "$HOME/.zfunc"
    mkdir "$SUB/$sub/plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions     "$SUB/$sub/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$SUB/$sub/plugins/zsh-syntax-highlighting"
    git clone https://github.com/hlissner/zsh-autopair             "$SUB/$sub/plugins/hlissner/zsh-autopair"
    git clone https://github.com/unixorn/fzf-zsh-plugin.git        "$SUB/$sub/plugins/unixorn/fzf-zsh-plugin" && \
        ln -s ~/.subzsh/plugins/unixorn/fzf-zsh-plugin/bin/* ~/.local/bin/
}

cmd_tmux() {
    ln -s "$SUB/.tmux.conf" "$HOME/.tmux.conf"
}

cmd_alacritty() {
    local sub=".config/alacritty"
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
}

cmd_nvim() {
    echo "sudo pacman -S npm ctags fzf glow; mkdir ~/.npm-global; npm config set prefix '~/.npm-global'"

    ln -s "$SUB/.config/nvim" "$HOME/.config/nvim"
    mkdir -p "$HOME/.local/bin"
    ln -s "$SUB"/.local/bin/* "$HOME/.local/bin"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    nvim +PackerCompile +PackerSync +PackerSync
}

cmd_ssh() {
    cat "$SUB/.ssh/config" >> "$HOME/.ssh/config"
}

cmd_git() {
    ln -s "$SUB/.gitconfig" "$HOME/.gitconfig"
    ln -s "$SUB/.gitignore" "$HOME/.gitignore"
    ln -s "$SUB/.githooks" "$HOME/.githooks"
}

cmd_ranger() {
    echo "sudo pacman -S highlight ttf-joypixels noto-fonts-emoji ueberzug poppler"

    local sub=".config/ranger"
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
    mkdir -p "$SUB/$sub/plugins"
    git clone https://github.com/alexanderjeurissen/ranger_devicons "$SUB/$sub/plugins/ranger_devicons"
    ranger --copy-config=all
}

cmd_gpg() {
    _die_if_installed "$HOME/.gnupg"

    cat "$SUB/.gnupg/gpg.conf" >> "$HOME/.gnupg/gpg.conf"
    echo -e "default-cache-ttl 1\nmax-cache-ttl 1" > "$HOME/.gnupg/gpg-agent.conf"; echo RELOADAGENT | gpg-connect-agent
}

_install_i3status() {
    local sub=".config/i3status"
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
}

_install_i3() {
    local sub=".config/i3"
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
}

cmd_i3() {
    echo "sudo pacman -S nitrogen picom compton ttf-font-awesome xdotool xclip maim"

    _install_i3
    _install_i3status
}

cmd_bat() {
    local sub=".config/bat"
    
    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
}

cmd_ipython() {
    local sub=".ipython"

    _die_if_installed "$HOME/$sub"

    mkdir -p "$HOME/$sub/profile_default"
    ln -s "$SUB/$sub/profile_default/ipython_config.py" "$HOME/$sub/profile_default/ipython_config.py"
}

cmd_font() {
    local sub="$HOME/.local/share/fonts"

    mkdir -p "$sub"
    cd "$sub"
    wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
    unzip FiraCode.zip -d "$sub"
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

cmd_psql() {
    local sub=".psqlrc"

    _die_if_installed "$HOME/$sub"

    ln -s "$SUB/$sub" "$HOME/$sub"
}

cmd_unlink() {
#####################################################
return 0
}

cmd_install() {
    case "$1" in
        bash) shift;           cmd_bash    "$@" ;;
        zsh) shift;            cmd_zsh    "$@" ;;
        tmux) shift;           cmd_tmux    "$@" ;;
        alacritty) shift;      cmd_alacritty    "$@" ;;
        nvim) shift;           cmd_nvim    "$@" ;;
        ssh) shift;            cmd_ssh    "$@" ;;
        git) shift;            cmd_git    "$@" ;;
        ranger) shift;         cmd_ranger    "$@" ;;
        gpg) shift;            cmd_gpg    "$@" ;;
        i3) shift;             cmd_i3    "$@" ;;
        bat) shift;            cmd_bat    "$@" ;;
        font) shift;           cmd_font    "$@" ;;
        termux) shift;         cmd_termux    "$@" ;;
        arch) shift;           cmd_arch    "$@" ;;
        psql) shift;           cmd_psql    "$@" ;;
    esac
}

cmd_help() {

    echo "Dotfiles installation script:
Usage: ./install.sh install (target)
Usage: ./install.sh unlink (target)
Usage: ./install.sh install-functions

targets:
 - bash
 - zsh
 - tmux
 - alacritty
 - nvim
 - ssh
 - git
 - ranger
 - gpg
 - i3
 - bat
 - font
 - termux
 - arch
 - psql
"

}


case "$1" in
    help) shift;                 cmd_help              "$@" ;;
    install) shift;              cmd_install           "$@" ;;
    unlink) shift;               cmd_unlink            "$@" ;;
esac
exit 0

