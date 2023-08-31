# dotfiles

all my dotfiles in one place

## the files

### rc.lua (awesome window manager)

customized keybinds and additional layouts. requires [Lain](https://github.com/lcpz/lain)
for layouts

### theme.lua (awesome window manager)

heavily customized minimal solid colour theme. square, flat, and purple. reminiscent of the olde days. 
again, requires [Lain](https://github.com/lcpz/lain) for some widgets. Contains theme elements for
[Collision](https://github.com/Elv13/collision) (recommended for improved window management
and navigation)

can be easily configured to colors other than purple 

### picom.conf 

some tweaks to compositor to go with awesomewm theme.

### .vimrc

contains plugins (managed with [vim-plug](https://github.com/junegunn/vim-plug))
, many quality of life settings, and a bunch of custom mappings. Themed partially 
like [helix](https://helix-editor.com/) editor 'boo berry' theme.

### .tmux.conf

lots of tweaks, including:

* fixed colours when tmuxing over ssh
* mouse support
* painless pane switching
* ctrl-space prefix for fewer hand cramps
* custom theme

### .bashrc

fairly basic, all customization is in .bash_aliases
 
### .bash_aliases

many aliases and settings to improve terminal experience. contains `confed` and 
`proj` autocomplete functions. use `confed` for quickly accessing important user
and system config files. use `proj` to jump to a dir and open project files.

of course, there is a custom prompt as well

### i3lock-preset.sh

i3lock theme to match awesomewm

### config.rasi (rofi)

custom settings for rofi launcher

### purple.rasi (rofi)

custom purple theme to match awesomewm

### boo_berry.vim (lightline)

modified version of Tomorrow_Night_Eighties.vim to look more like boo berry


