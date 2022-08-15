# File paths
I3="./i3"
ZSH="./zsh"
VIM="./nvim"
ALACRITTY="./alacritty"

# Colors
RESET='\033[0m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BRED='\033[1;31m'
GREEN='\033[0;32m'

# Functions
function setup_i3() {
    echo -e "${YELLOW}The following will be done:\n
    1) New directory '$HOME/.config/i3' will be created.
    2) New directory '$HOME/.config/polybar' will be created.
    3) New directory '$HOME/.config/alacritty' will be created.
    4) New directory '$HOME/.config/rofi' will be created.
    5) 'i3' config will be copied to '$HOME/.config/i3'.
    6) 'polybar' config will be copied to '$HOME/.config/polybar'.
    7) 'alacritty' config will be copied to '$HOME/.config/alacritty'.
    8) 'rofi' config will be copied to '$HOME/.config/rofi/'.\n${RESET}"
    read -p "Continue? (y/n) " option
    echo ""

    if [[ ${option} == [yY] ]]; then
        if [[ ! -d "$HOME/.config/i3" ]]; then
            echo -e "${RED}'i3' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/i3
        else
            echo -e "${GREEN}'i3' directory exists.${RESET}"
        fi
        cp ${I3}/i3_config $HOME/.config/i3/config
        echo -e "${GREEN}Copied 'i3' config!${RESET}"

       if [[ ! -d "$HOME/.config/polybar" ]]; then
            echo -r "${RED}'polybar' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/polybar
        else
            echo -r "${GREEN}'polybar' directory exists.${RESET}"
       fi

        cp ${I3}/polybar/* $HOME/.config/polybar
        echo -r "${GREEN}Copied 'polybar' config files!${RESET}"

        if [[ ! -d "$HOME/.config/alacritty" ]]; then
            echo -r "${RED}'alacritty' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/alacritty
        else
            echo -r "${GREEN}'alacritty' directory exists.${RESET}"
        fi
        cp ${ALACRITTY}/alacritty.yml $HOME/.config/alacritty
        echo -r "${GREEN}Copied 'alacritty' config!${RESET}"

        if [[ ! -d "$HOME/.config/rofi" ]]; then
            echo -r "${RED}'rofi' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/rofi
        else
            echo -r "${GREEN}'rofi' directory exists.${RESET}"
        fi
        cp ${I3}/rofi_config $HOME/.config/rofi/config.rasi
        echo -r "${GREEN}Copied 'rofi' config!\n${RESET}"

        echo -r "${GREEN}Done!\n${RESET}"
    fi
    
    echo -e "${BRED}NOTE: The following packages must be installed manually!\n${RESET}"
    echo -e "${YELLOW}
    1) i3-gaps (or i3)
    2) polybar
    3) rofi
    4) alacritty
    5) feh${RESET}"
}

function setup_zsh() {
    echo -e "${YELLOW}The following will be done:\n
    1) New directory '$HOME/.config/Scripts' will be created.
    2) Files 'aliasesrc', 'set_ls_colors.sh' and 'tmux.conf' will be copied to '.config/Scripts'.
    3) File '.zshrc' will be copied to '$HOME'.\n${RESET}"
    read -p "Continue? (y/n) " option
    echo ""

    if [[ ${option} == [yY] ]]; then
        cp ${ZSH}/zshrc $HOME/.zshrc
        echo -e "${GREEN}Copied '.zshrc' to '$HOME'${RESET}!"
        
        if [[ ! -d "$HOME/.config/Scripts" ]]; then
            echo -e "${RED}'Scripts' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/Scripts
        else
            echo -e "${GREEN}'Scripts' directory exists."
        fi

        cp ${ZSH}/aliasesrc ${ZSH}/set_ls_colors.sh ${ZSH}/tmux.conf $HOME/.config/Scripts
        echo -e "${GREEN}Copied 'aliasesrc', 'set_ls_colors.sh' and 'tmux.conf' to 'Scripts' directory!\n${RESET}"
        echo -e "${GREEN}Done!\n${RESET}"
    fi

    echo -e "${BRED}NOTE: The following packages must be installed manually!\n${RESET}"
    echo -e "${YELLOW}
    1) zsh
    2) tmux
    3) (optional) fzf
    4) (optional) new version of 'less'${RESET}"
    echo -e "${YELLOW}Optional ones are used in the 'aliasesrc'.\n${RESET}"
}

function setup_vim() {
    echo -e "${YELLOW}The following will be done:\n
    1) New directory '$HOME/.config/nvim' and '$HOME/.config/nvim/nvim_plugins' will be created.
    2) 'vim-plug' will be installed\n${RESET}"
    read -p "Continue? (y/n) " option
    echo ""

    if [[ ${option} == [yY] ]]; then
        if [[ ! -d "$HOME/.config/nvim" ]]; then
            echo -e "${RED}'nvim' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/nvim
        else
            echo -e "${GREEN}'nvim' directory exists!${RESET}"
        fi

        if [[ ! -d "$HOME/.config/nvim/nvim_plugins" ]]; then
            echo -e "${RED}'nvim_plugins' directory does not exist! Creating it...${RESET}"
            mkdir $HOME/.config/nvim/nvim_plugins
        else
            echo -e "${GREEN}'nvim_plugins' directory exists!${RESET}"
        fi

        cp ${VIM}/init.vim $HOME/.config/nvim
        echo -e "${GREEN}Copied 'nvim' config file!${RESET}"

        if [[ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]]; then
            echo "${RED}'vim-plug' does not exist!\n${RESET}"
            echo "${YELLOW}It can be installed from the following repository 'https://github.com/junegunn/vim-plug'\n${RESET}"
            read -p "Install 'vim-plug'? (y/n)" option
            
            if [[ ${option} == [yY] ]]; then
                sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
                echo "${GREEN}'vim-plug' installed!${RESET}"
            else
                echo "${YELLOW}Plugin support will not be available!${RESET}"
            fi
        fi

        echo -e "${BRED}NOTE: The following packets must be installed manually!\n${RESET}"
        echo -e "${YELLOW}
        1) nvim later than 0.5.0
        2) Latest lua
        3) PlugInstall inside nvim
        4) LSPs according to 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md'
        5) xclipboard
        6) 'Nerd Fonts' Cascadia Code icon extension pack${RESET}"
    fi
}


# Main
echo -e "${GREEN}This is an automated script to setup i3, zsh and nvim config files.
Some setup must be done by the user manually\n.
    1) i3
    2) zsh
    3) nvim${RESET}"

read -p "Enter a number: " option
echo ""

if [[ ${option} == 1 ]]; then
    setup_i3
elif [[ ${option} == 2 ]]; then
    setup_zsh
elif [[ ${option} == 3 ]]; then
    setup_vim
fi
    

