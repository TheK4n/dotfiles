readonly TARGETS="\
colors:.config/terminal-colors.d
tmux:.config/tmux .tmux .config/systemd/user/tmux.service .local/bin/tmux_start_session.sh .local/bin/tmux_list_sessions.sh .local/bin/tmux_attach_session.sh .local/bin/tmux_kill_sessions.sh
zsh:.config/zsh .zshenv .inputrc .local/bin/t %colors
alacritty:.config/alacritty
nvim:.config/nvim .editorconfig .inputrc .editrc .local/bin/vim_askpass_helper
ssh:
less:.lesskey
git:.config/git
ranger:.config/ranger
gpg:
i3:.xinitrc .xprofile .Xresources .config/i3 .config/i3status .local/bin/i3status_wrapper .config/rofi .config/picom .local/bin/slm .local/bin/slm_rofi.sh .local/bin/power_rofi.sh .local/bin/wifi .local/bin/bluetooth .local/bin/i3_switch_workspace.sh
bat:.config/bat
font:
termux:.termux
arch:
psql:.psqlrc
docker:.docker/cli-plugins
ipython:.ipython/profile_default/ipython_config.py
gdb:.config/gdb"