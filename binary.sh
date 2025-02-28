#!/bin/bash

#type
#p - for playlists [default]
#s - for songs

#customization
#f - change default font

#t - temporary / just play / put it to temp files

#i - play immediately
#d - download first then play [default]

#c - cookies from browser with input which browser

#o - original order [default]
#S - shuffled order

#debugging
#u - update data.json file with T for thumbnail with P for playlist etc
#T - update thumbnails high, used with u as in update data.json 
#P - update playlist as in new link 
#w - for overwrite
name="hackspotify"
path_home=$HOME/Music/$name
path=$path_home


OPTSTRING=":tidwuSo"
flag_t=false
flag_i=false
flag_d=true
flag_w=false
flag_u=false
flag_S=false
flag_o=true

userInput=""
userInputProcessed=""

bg=''
font='mono9'

api_key=null
api_call="error when fetching..."
type="playlist"

exists=false

check_if_everything_all_right () {
    if [ ! -d $HOME/Music ]
    then 
        read -n1 -p "Music folder unavailable, would you like to create one? (y/n)"  response
        case "$response" in
            [yY])
                echo "making a music folder"
                mkdir $HOME/Music
                ;;
            ?) echo "you said no :("
                exit 1
                ;;
        esac
    fi
    if [ ! -d $path_home ];then
        echo "created home for $name"
        mkdir $path_home
        touch $path_home/.secrets.txt
        echo "api key here..." >> $path_home/.secrets.txt

    fi
    if [ ! -f  $path_home/.secrets.txt ];then
        touch $path_home/.secrets.txt
        echo "api key here..." > $path_home/.secrets.txt
    fi
    if [ "$(cat $path_home/.secrets.txt)" = "api key here..." ];then
        read -n1 -p "You didn't input your api key in $path_home/.secrets.txt file, would you like to do it now? (y/n)"  response
        echo ""
        case "$response" in
            [yY])

                echo "input your api key> "
                read api_key
                echo "api key is $api_key"
                echo $api_key>$path_home/.secrets.txt

                ;;
            ?) echo "you said no, implement it on your own"
                exit 1
                ;;
        esac
    fi
}
read_arguments() {
   userInput=""

    while getopts "$OPTSTRING" opt; do
        echo "opt je $opt"
        case "${opt}" in
            t) 
                echo "case -t is activated"
                flag_t=true
                path=/tmp/hackspotify
                ;;
            i)
                echo "case -i is activated"
                flag_i=true
                flag_d=false
                bg='&'
                ;;
            d)
                echo "case -s is activated"
                flag_d=true
                ;;
            w)
                echo "case -w is activated"
                flag_w=true
                ;;
            u)
                echo "case -u is activated"
                flag_u=true
                ;;
            S)
                echo "case -S is activated"
                flag_S=true
                flag_o=false
                ;;
            o)
                echo "case -o is activated"
                
                ;;
            ?)
                echo "Unknown option -${OPTARG}"
                exit 1   
                ;;
        esac
    done

    shift $((OPTIND - 1))

    if [ -z "$userInput" ] && [ "$#" -gt 0 ]; then
        userInput="$*"  
    fi

    echo "Captured user input: $userInput"
    userInputProcessed=$(echo "$userInput" | tr '[:upper:]' '[:lower:]')
#    userInputProcessed=$(echo "$userInputProcessed" | tr ' ' '\n' | sort | tr '\n' ' ' | sed 's/ $//')
    userInputProcessed="${userInputProcessed// /%20}"
    echo "Processed user input: $userInputProcessed"
}

create_environment(){
    mkdir -p $path
    if [ -d $path/"$userInput" ];then
        exists=true
        echo "it already exists"
    fi
    mkdir -p $path/"$userInput"
    mkdir -p $path/"$userInput"/songs
    echo "">>$path/"$userInput"/data.json
    if ( "$exists" = "true" && "$flag_u" = "true" );then
        echo "brisem sve"
        rm -f $path/"$userInput"/songs/*
    fi
}

call_api(){
    link_default="https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1"
    api_key=$(cat $path_home/.secrets.txt)
    if ( ! $exists -o $flag_u );then
        echo "ne postosji pozovi api"
        echo $(curl -s "$link_default&q=$userInputProcessed&type=$type&key=$api_key" | jq .items[]) >$path/"$userInput"/data.json
    fi
    link_id=$(cat $path/"$userInput"/data.json | jq -r .id.playlistId)
    link="https://www.youtube.com/$type?list=$link_id"
    link_thumbnail=$(cat $path/"$userInput"/data.json | jq -r .snippet.thumbnails.high.url)
}
downloading(){
    if [[ "$exists" = "false" || "$flag_u" = "true" ]];then
        echo "tu sam skidam "
        if ( $flag_i );then
            yt-dlp --lazy-playlist -wxqP $path/"$userInput"/songs $link & 
        else
            echo "downloading wait a min"
            yt-dlp --lazy-playlist -wxP $path/"$userInput"/songs $link & 
            yt_dlp_pid=$!
            echo "yt_dlp pid je $yt_dlp_pid"
            wait $yt_dlp_pid
            echo "songs are finished downloading"
        fi    
    fi

}
display_thumbnail(){
    catimg -H 40 <(curl -s $link_thumbnail)
    echo "playing this song: $song"
    figlet -tf $font "$name"
}
play_music(){
    fl=0
    
    while [ $(ls $path/"$userInput"/songs | wc -l) -le 1 ]
    do
        #echo $(ls $path/"$userInput"/songs | wc -l)
        if [ $fl -eq 0 ];then
            echo "magic happening..."
            fl=1
        fi
    done
    echo "imma play now..."
    
    echo $songs
    while true;do
    if ( $flag_o );then
        echo "bice originalan"
        IFS=$'\n' songs=$(ls -crt $path/"$userInput"/songs)
    else
        echo "bice shuf"
        IFS=$'\n' songs=$(ls $path/"$userInput"/songs | shuf)
    fi
    for song in $songs; do
        clear
        display_thumbnail  
        mpv $path/"$userInput"/songs/"$song"
        if ( $flag_o );then
            echo "bice originalan"
            IFS=$'\n' songs=$(ls -crt $path/"$userInput"/songs)
        else
            echo "bice shuffle"
            IFS=$'\n' songs=$(ls $path/"$userInput"/songs | shuf)
        fi
        #if ( "$yt_dlp_pid" )
        echo "kraj songs su $songs $yt_dlp_pid"
    done
    done
    

}

check_if_everything_all_right
read_arguments "$@"
create_environment
call_api

echo "link id je : $link_id"
echo "link je tu: $link"
echo "User input je: $userInput"
echo "link thumbnaila je: $link_thumbnail"
echo "exists: $exists"

if [ -z "$link_id" ]; then
    echo "API key doesn't work or returned no results."
    exit 3
fi
#echo "exists je $exists"
#echo "flag u je $flag_u" 
downloading 

play_music

