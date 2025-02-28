#!/bin/bash
#sudo apt update

commands_needed="figlet mpv catimg"
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

sudo curl -so /usr/bin/hackspotify https://raw.githubusercontent.com/frenki1004/hackspotify/main/binary.sh 
sudo chmod +x /usr/bin/hackspotify