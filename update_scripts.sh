scripts_folder="$HOME/.config/Scripts"
nvim_folder="$HOME/.config/nvim"
alacritty_folder="$HOME/.config/alacritty"
i3_folder="$HOME/.config/i3"

copy_to_scripts()
{
	printf "Scripts folder exists.\nCopying aliasesrc and tmux.conf\n"
	cp ./aliasesrc $scripts_folder
	cp ./tmux.conf $scripts_folder
	cp ./set_ls_colors.sh $scripts_folder
	printf "Done!\n\n"
}

nvim_init()
{
	printf "Copying nvim files.\n"
	cp ./init.vim $nvim_folder
	printf "Done!\nYou may need to install Plug for nvim.\n\n"
}

alacritty_init()
{
	printf "Copying alacritty files.\n"
	cp ./alacritty.yml $alacritty_folder
	printf "Done!\n\n"
}

i3_init()
{
    printf "Copying i3 config.\n"
    cp ./i3_config $i3_folder/config
    printf "Done!\n\n"
}

printf "Copying zshrc to home.\n"
cp ./.zshrc $HOME

if [ -d $scripts_folder ]
then
	copy_to_scripts
else
	printf "Scripts folder does not exist. Creating it...\n"
	mkdir -p $scripts_folder
	copy_to_scripts
fi

if [ -d "$nvim_folder" -a -d "$nvim_folder/nvim_plugins" ]
then
	nvim_init
else
	printf "Nvim folders does not exist. Creating them...\n"
	mkdir -p $nvim_folder
	mkdir -p "$nvim_folder/nvim_plugins"
	nvim_init
fi

if [ -d "$alacritty_folder" ]
then
	alacritty_init
else
	printf "Alacritty folder does not exist. Creating it...\n"
	mkdir -p $alacritty_folder
	alacritty_init
fi

if [ -d "$i3_folder" ]
then
    i3_init
else
    printf "i3 folder does not exist. Creating it...\n"
    mkdir -p $i3_folder
    i3_init
fi

