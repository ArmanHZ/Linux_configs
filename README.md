**Note: This is slightly outdated. I am working on a newer version, which simplifies a lot of steps.**

# My linux configs
These are the config files I use for my minimal Arch Linux setup. This setup is mostly used as a VM for penetration testing.
However, I share these config files for friends and others to use or get inspired by them.

# Installation
The environment consists of `i3 window manager`, `zsh shell` and `alacritty termianl`. The color scheme and themes used are Dracula.

The script is not complete automation and the user still needs to perform some tasks manually. These are mainly installing packages and vim plugins. The script mentions which actions must be done manually.

To setup `i3`, `alacritty`, `polybar` and `rofi` run `environment_setup.sh` and select option `1`.

To setup `zsh` and some aliases run `environment_setup.sh` and select option `2`.

To setup `nvim` and install `vim-plugged` as well as setting up some plugin directories run `environment_setup.sh` and select option `3`.

__Note: The script will create the necessary directories if they don't exist. You will be prompt to create these directories.__

### For keyboard delay rate
```bash
# .xinitrc before starting the window manager
xset r rate 250 35
```

