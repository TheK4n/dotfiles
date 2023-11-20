
CHOOSED_SCREEN_LAYOUT="$(slm ls | rofi -dmenu -i -p "Select screen layout")"


slm load "$CHOOSED_SCREEN_LAYOUT"
