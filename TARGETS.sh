readonly TARGETS="\
colors:.config/terminal-colors.d
less:.lesskey .infokey
tmux:.config/tmux .tmux .config/systemd/user/tmux.service %copypasta
t:
note:
psw:
zsh:.config/zsh .zshenv .zshenv.d .inputrc %copypasta %colors
alacritty:.config/alacritty
nvim:.config/nvim .editorconfig .editrc .local/bin/vim_askpass_helper
ssh:
git:.config/git .local/bin/ga
ranger:.config/ranger
gpg:
sway:.config/sway .config/i3blocks .config/mako .config/mimeapps.list .config/rofi .local/bin/screenshot .config/swaylock .Xresources .local/bin/slm .local/bin/slm_rofi %copypasta %pomodoro
pomodoro:
bat:.config/bat
font:
termux:.termux
arch:
psql:.psqlrc
docker:.docker/cli-plugins
ipython:.ipython/profile_default/ipython_config.py
gdb:.config/gdb
sandbox:
chromium:.local/bin/pchromium .local/share/applications/pchromium.desktop
scripts:.local/bin/httpstatus .local/bin/apco .local/bin/bb .local/bin/emoji .local/bin/mksh .local/bin/nato .local/bin/pastas .local/bin/timer .local/bin/tryna .local/bin/trynafail .local/bin/bak .local/bin/cleanup-directory .local/bin/cleanup-directory-log .local/bin/cleanup-downloads .local/bin/gobuild .local/bin/json .local/bin/open .local/bin/py .local/bin/sha .local/bin/showtips .local/bin/weather .local/bin/radio .local/bin/rmt .local/bin/scratch .local/bin/wake .local/bin/myip .local/bin/genpass .local/bin/gensalt .local/bin/django-create-project .local/bin/mirror-site .local/bin/split-file .local/bin/extract .local/bin/destroy .local/bin/serveit .local/bin/highlight-logs %copypasta
music:.local/bin/mpv-service.sh .config/systemd/user/mpv.service .local/bin/player
copypasta:.local/bin/copy .local/bin/pasta
all:%less %t %note %tmux %zsh %nvim %git"
