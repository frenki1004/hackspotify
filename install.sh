#!/bin/bash

commands_needed="figlet toilet mpv catimg"
for command in $commands_needed
do
    echo "current command is $command"
    if [ ! -e /usr/bin/$command ]
    then
        echo "downloading $command..."
        sudo apt install -y $command
    else
        echo "alr there"
    fi

done
path='/etc/apt/sources.list.d/tomtomtom-ubuntu-yt-dlp-noble.sources'
#path='/home/slowcured/Documents/projekti/hackspotify/gama/setup.sh'
#echo $path
if [ -e $path ]
then
    echo "exists"
else
    echo "doesn't exist, downloading it"
    sudo add-apt-repository ppa:tomtomtom/yt-dlp    # Add ppa repo to apt
    sudo apt update                                 # Update package list
    sudo apt install yt-dlp                         # Install yt-dlp
fi

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