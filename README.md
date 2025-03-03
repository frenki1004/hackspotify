# hackspotify
INTRO

Hello and welcome to my first opensource project on github called hackspotify, why? Because it sounds super cool
WORKS ONLY ON UBUNTU !! (for now...)
I have done this in like a couple of days and its super fun and useful for me so i decided why not publish it on github, so here we are.
Im mostly depending on a powerful tool called yt-dlp on linux which downloads any video from the internet with loads of available options, hope you enjoy it here are some pictures




TUTOIRAL

before installing, checkout the code
install simply with: 
sudo apt update
sudo curl -s https://raw.githubusercontent.com/frenki1004/hackspotify/main/install.sh | bash
after that what is recommended that you put your own youtube api key in the $HOME/Music/hackspotify/.secrets like this
nano $HOME/Music/hackspotify/.secrets

paste your api key here without any spaces or backspaces !!!!! [ctrl+shift+v]
now everything should work like this


just run it anytime with
hackspotify "whatever you want to listen to"
preferably use this format -> 
hackspotify [-flags] [ARTIST NAME] [ALBUM NAME] album
for example:
hackspotify -iS kanye west graduation album
flags ive implemented so far are -tiduSo
-t temporary, it saves your download music to your /tmp files which are deleted regularly, use this when you want to just listen to something without downloading it

-i immediately play, without waiting for it to download
-d download and then play, that's the default option

-u update, as in if you have problems or something didn't download right just run -u and it will try again

-S shuffle, 
-o original order as in the youtube playlist

if you forget what everything does just run cat /usr/bin/hackspotify | head -n 25
ENJOY!!
