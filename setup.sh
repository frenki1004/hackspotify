#!/bin/bash

home=$HOME/Music/hackspotify
name="hackspotify"

if [ ! -d $HOME/Music ]
then
    echo 
    read -n1 -p "Music folder unavailable, would you like to create one? (y/n)"  response
    echo "ans je $response"
    case "$response" in
        [yY])
            echo "pravim music folder"
            mkdir $HOME/Music
            ;;
        ?) echo "you said no :("
            ;;
    
    esac
fi
if [ ! -d $home ]
then
    echo "created home for $name"
    mkdir $home
fi
