readonly TARGETS="\
colors:.config/terminal-colors.d
less:.lesskey .infokey
tmux:.config/tmux .tmux .config/systemd/user/tmux.service .local/bin/tmux_start_session.sh .local/bin/tmux_list_sessions.sh .local/bin/tmux_attach_session.sh .local/bin/tmux_kill_sessions.sh .local/bin/tmux_start_projects.sh
t:
note:
zsh:.config/zsh .zshenv .zshenv.d .inputrc %colors
alacritty:.config/alacritty
nvim:.config/nvim .editorconfig .editrc .local/bin/vim_askpass_helper
ssh:
git:.config/git
ranger:.config/ranger
gpg:
i3:.xinitrc .xprofile .Xresources .config/i3 .config/i3status .local/bin/i3status_wrapper .config/rofi .config/picom .local/bin/slm .local/bin/slm_rofi.sh .local/bin/power_rofi.sh .local/bin/i3_switch_workspace.sh
bat:.config/bat
font:
termux:.termux
arch:
psql:.psqlrc
docker:.docker/cli-plugins
ipython:.ipython/profile_default/ipython_config.py
gdb:.config/gdb
sandbox:
utils:.local/bin/myip .local/bin/genpass .local/bin/gensalt .local/bin/django-create-project .local/bin/mirror-site .local/bin/split-file .local/bin/extract .local/bin/destroy
chromium:.local/bin/pchromium .local/share/applications/pchromium.desktop
all:%less %t %note %tmux %zsh %nvim %git"
