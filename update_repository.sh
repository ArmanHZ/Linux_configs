# This script copies updated local files to the repository directory.

vimrc_path="$HOME/.config/nvim/init.vim"
tmux_conf_path="$HOME/.config/Scripts/tmux.conf"
zshrc_path="$HOME/.zshrc"
aliases_path="$HOME/.config/Scripts/aliasesrc"
alacritty_yml_path="$HOME/.config/alacritty/alacritty.yml"
i3_config_path="$HOME/.config/i3/config"

printf "Copying vimrc...\n"
cp $vimrc_path .

printf "Copying tmux config...\n"
cp $tmux_conf_path .

printf "Copying zshrc...\n"
cp $zshrc_path .

printf "Copying aliases...\n"
cp $aliases_path .

printf "Copying alacritty.yml...\n"
cp $alacritty_yml_path .

printf "Copying i3 config...\n"
cp $i3_config_path ./i3_config

