exists=true
flag_u=false
userInput="juice wrld 999 ep"
    if [ -z ~/Music/hackspotify/"$userInput"/data.json ];then
        echo "API key doesnt work or you didn't update, run all the same but with -u as in update"
        exit 1
    else
        echo "postoji"
    fi