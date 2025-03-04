#!/bin/bash

if [ -e /usr/bin/hackspotify ];then
    sudo rm -f /usr/bin/hackspotify
fi
sudo curl -so /usr/bin/hackspotify https://raw.githubusercontent.com/frenki1004/hackspotify/main/binary.sh 
sudo chmod +x /usr/bin/hackspotify
echo "
_hackspotify_autocomplete() {
    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$(ls ~/Music/hackspotify)" -- "$cur") )
    return 0
}
">>~/.bash_completion
source ~/.bashrc