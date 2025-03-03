#ovo je navodno radilo neko vrijeme al ne za mid sentence
_hackspotify_complete() {
    local cur dir
    cur="${COMP_WORDS[COMP_CWORD]}"
    dir=~/Music/hackspotify

    # Generate list of filenames (not full paths), handling spaces and special characters
    COMPREPLY=($(compgen -W "$(ls "$dir")" -- "$cur"))
}

complete -F _hackspotify_complete hackspotify



#za ovo moras bit u tom folderu
_hackspotify_autocomplete() {
    local cur
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "$(ls ~/Music/hackspotify)" -- "$cur") )
    return 0
}
