#!/bin/bash
opcijice=$(ls ~/Music/hackspotify)


while [ $# -gt 0 ]; do
  arg=$1
  case $arg in
    option_1)
     # do_option_1
    ;;
    option_2)
     # do_option_2
    ;;
    shortlist)
        for x in "${opcijice[@]}";do
            echo $x
        done
    ;;
    *)
     echo Wrong option
    ;;
  esac
  shift
done
