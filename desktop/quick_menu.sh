#! /usr/bin/env bash
# Rofi script for opening multiple programs at once from a quick-menu

# Execute menu selection. Selection is passed back through as argument
if [ "$1" = "Email/Calendar" ]; then
  coproc ( firefox -url outlook.office.com/mail/ mail.google.com canvas.usask.ca\
                   -new-window calendar.google.com \
                   > /dev/null 2>&1 )
  coproc ( obsidian > /dev/null 2>&1 )
  exit 0  
elif [ "$1" = "Tuxworld" ]; then
  coproc  ( gnome-terminal -- sh -c "bash -c \"ssh tux6; exec bash\"" )
  exit 0
elif [ "$1" = "Notes" ]; then
  coproc ( obsidian > /dev/null 2>&1 )
  coproc ( gnome-terminal -- sh -c "bash -c \"cd Vault; helix *; exec bash\"" )
  exit 0
elif [ "$1" = "Movies" ]; then
  coproc ( gnome-terminal -- sh -c "bash -c \"cd Movies; \
                  /home/analog/.fzf/bin/fzf \
                  --bind 'enter:become(vlc {+}),ctrl-i:become(cvlc {+})' \
                  --header '/ ENTER (vlc) / CTRL-I (vlc - no interface) /';\"" )
  exit 0
fi

# Menu options
echo "Email/Calendar"
echo "Tuxworld"
echo "Notes"
echo "Movies"
