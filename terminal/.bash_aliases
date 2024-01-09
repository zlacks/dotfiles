# Add these lines to .bashrc to add this file
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

#############
#  ALIASES  #
#############

alias src='source ~/.bashrc'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias asw='audio-switch'
alias hx='helix'
alias fzedit="fzf --bind 'enter:become(helix {+}),ctrl-v:become(vim -p {+})' \
                  --header '/ ENTER (helix) / CTRL-V (vim) /'"
alias fzwatch="fzf --bind 'enter:become(vlc {+}),ctrl-i:become(cvlc {+})' \
                   --header '/ ENTER (vlc) / CTRL-I (vlc - no interface) /'"
alias clip='xclip -selection clipboard'
alias man='man -P "bat -p"'

#############
#  EXPORTS  #
#############

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# use bat as the default pager
export PAGER="bat"

# coloured man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# set helix as the default editor
export EDITOR='helix'
export VISUAL='helix'

# Always enable multi-select w/ additional keybinds
export FZF_DEFAULT_OPTS='
  --multi 
  --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'

# Enable file preview using 'bat' when using Ctrl-T
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Show tree preview for each directory
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Enable "**" fuzzy autocomplete for these programs
_fzf_setup_completion path vlc

###########
#  BINDS  #
###########

# tab cycle through completion possibilites
bind 'TAB:menu-complete'

# shift-tab to cycle backwards
bind '"\e[Z": menu-complete-backward'

# "find" all matches (show list like classic bash)
bind '"\C-f": possible-completions'

###############
#  FUNCTIONS  #
###############

#
# Quickly edit config files.
#
declare -A configs
configs[awesome]="helix $HOME/.config/awesome/rc.lua $HOME/.config/awesome/theme.lua $HOME/.config/awesome/autorun.sh"
configs[picom]="vim $HOME/.config/picom/picom.conf"
configs[tmux]="vim $HOME/.tmux.conf"
configs[bash_aliases]="helix $HOME/.bash_aliases"
configs[bash]="helix $HOME/.bashrc"
configs[ssh]="helix $HOME/.ssh/config"
configs[sshd]="sudo vim /etc/ssh/sshd_config"
configs[fstab]="sudo vim /etc/fstab"
configs[i3lock]="sudoedit /bin/i3lock-preset.sh"
configs[rofi]="helix $HOME/.config/rofi/config.rasi"
configs[rofi-theme]="helix $HOME/.config/rofi/purple.rasi"
configs[rofi-quick]="helix $HOME/.config/rofi/scripts/quick_menu.sh"
configs[vim]="vim $HOME/.vimrc"
configs[retroarch]="vim $HOME/.config/retroarch/retroarch.cfg"
configs[pacman]="sudo vim /etc/pacman.conf"

confed(){
  if [ $# -ne 1 ]; then
    printf "Possible options:\n%s\n" "${!configs[*]}" 
    return
  fi
  
  # If key exists, run command stored in key
  [ "${configs[$1]+a}" ] && ${configs[$1]}
}

# Autocomplete for confed
_confed_complete(){
  # list of options
  local options="${!configs[*]}"

  # current word being complete (stock bash completion)
  local current_word="${COMP_WORDS[COMP_CWORD]}"

  # create list of possible matches and store to ${COMPREPLY[@]}
  COMPREPLY=($(compgen -W "${options}" -- "$current_word"))
}
complete -F _confed_complete confed

#
# jump to a hotspot
#
declare -A jumplist
jumplist[353]="cd $HOME/Sync/cmpt353"
jumplist[332]="cd $HOME/Sync/cmpt332"
jumplist[381]="cd $HOME/Sync/cmpt381"
jumplist[dotfiles]="cd $HOME/Repos/dotfiles"
jumplist[advent]="cd $HOME/Sync/advent2023"
jumplist[hypno]="cd $HOME/Sync/hypnobabies"

j(){
  # If key exists, run command stored in key
  [ "${jumplist[$1]+a}" ] && ${jumplist[$1]}
}

# Autocomplete for jump
_j_complete(){
  # list of options
  local options="${!jumplist[*]}"

  # current word being complete (stock bash completion)
  local current_word="${COMP_WORDS[COMP_CWORD]}"

  # create list of possible matches and store to ${COMPREPLY[@]}
  COMPREPLY=($(compgen -W "${options}" -- "$current_word"))
}
complete -F _j_complete j

#
# Open a currently in progress project
#
proj(){
  if [ "$1" = "cmpt332" ]; then
    cd ~/Repos/cmpt332/a1/ || exit 1
    hx Makefile ./*.c ./*.h ./*.bash
  elif [ "$1" = "xv6-a1" ]; then
    cd ~/Repos/cmpt332/xv6/ || exit 1
    vim Makefile kernel/syscall.* proc.* sysproc.c defs.h types.h param.h
  fi
}

_proj_complete(){
  # list of options
  local options="cmpt332"

  # current word being complete (stock bash completion)
  local current_word="${COMP_WORDS[COMP_CWORD]}"

  # create list of possible matches and store to ${COMPREPLY[@]}
  COMPREPLY=($(compgen -W "${options}" -- "$current_word"))
}
complete -F _proj_complete proj

#
# Spin up a docker container and attach.
#
dk(){
  if [ $# -eq 0 ]; then
    docker compose up -d
  elif [ "$1" = "fresh" ]; then
    docker compose down
    docker compose build --no-cache
    docker compose up -d
  elif [ "$1" = "down" ]; then
    docker compose down
  fi
}

_dk_complete(){
  # list of options
  local options="fresh down"

  # current word being complete (stock bash completion)
  local current_word="${COMP_WORDS[COMP_CWORD]}"

  # create list of possible matches and store to ${COMPREPLY[@]}
  COMPREPLY=($(compgen -W "${options}" -- "$current_word"))
}
complete -F _dk_complete dk

# Copy absolute file path to clipboard
cpypath(){
  if [ $# -eq 0 ]; then
    printf "Usage: cpypath <file/dir names ...>\n"
    return 1
  fi

  for file in "$@"; do
    if [ ! -e "$file" ]; then
      printf "\"%s\" does not exist! Not copied to clipboard\n" "$file"
      continue
    fi

    abspath=$(readlink -f "$file")
    xclip -selection clipboard <<< "$abspath"
    printf "Copied \"%s\" to clipboard!\n" "$abspath"
    sleep 0.5s
  done
}

############
#  PROMPT  #
############

gen_path(){
  DBASE="$(basename "$1")"
  DREST="$(dirname "$1")"
  if [ "$PWD" == "$HOME" ]; then
    printf '~'
  elif [ "$DREST" == "$HOME" ]; then
    printf '~/%s' "$DBASE"
  elif [ "$DBASE" == "/" ] && [ "$DREST" == "/" ]; then
    printf "$PWD"
  elif [ "$DREST" == "/" ]; then
    printf "/%s" "$DBASE"
  else
    DPARENT="$(basename "$DREST")"
    printf "%s/%s" "$DPARENT" "$DBASE"
  fi
}

PS1_ARROW_COLOUR="\[\033[38;5;39m\]"
PS1_HOSTNAME_COLOUR="\[\033[38;5;135m\]"
PS1_DIR_COLOUR="\[\033[38;5;74m\]"
PS1_NAME_COLOUR="\[\033[01;38;5;135m\]"
COLOUR_RESET="\[\033[m\]"
GITBRANCH="\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')"
PARENT_PWD="\$(gen_path \"\$PWD\")"
export PS1="\n$PS1_ARROW_COLOUR┌─$PS1_NAME_COLOUR\u$COLOUR_RESET$PS1_HOSTNAME_COLOUR@\h$PS1_DIR_COLOUR[$PARENT_PWD]$PS1_ARROW_COLOUR$GITBRANCH$COLOUR_RESET\n $PS1_ARROW_COLOUR└─> $COLOUR_RESET"
