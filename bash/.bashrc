# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Run keychain
eval $(keychain --eval --quiet id_rsa --nogui)

# Fix tmux pwd
[ "x${PWD#/mnt/uhome/}" != "x$PWD" ] && cd /home/${PWD#/mnt/uhome/}

# Custom prompt
export TRUNCATED_PATH='$(pwd | sed "s,$HOME,~," | awk -F "/" '"'"'{if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF; else if (NF>3) print $1 "/" $2 "/.../" $NF; else print $1 "/.../" $NF; } else print $0;}'"'"')'
if tty | grep pts > /dev/null; then
	PS1='\[\e[30;104m\] \h | $(eval "echo ${TRUNCATED_PATH}") \[\e[94;49m\]\[\e[0m\] '
else
	PS1='$(eval "echo ${TRUNCATED_PATH}")> '
fi

# Editor
export EDITOR=vim
# Pager
export PAGER='less -S'

export ANDROID_HOME=/home/joe/apps/adk

# PATH
export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin:/home/joe/apps/lilypond/bin:/home/joe/apps/flex/bin:/home/joe/apps/flashplayer:/home/joe/apps/sonic-annotator:/home/joe/apps/adk/tools:/home/joe/apps/adk/platform-tools:/home/joe/apps/gcc-arm-none-eabi-4_7-2013q3/bin/:/usr/local/lpcxpresso_4.2.3_255/lpcxpresso/bin:/home/joe/apps/google_appengine:/home/joe/apps/aminc:/home/joe/apps/processing-3.3/:/home/joe/code/go/bin:/usr/local/heroku/bin:/home/joe/.npm-global/bin:/home/joe/apps/composer:/home/joe/.local/bin:/home/joe/apps/genymotion:/home/joe/.cargo/bin

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

export GOPATH=/home/joe/code/go
export OPENSCADPATH=/home/joe/code/scad/lib

export VST_PATH=/home/joe/Recording/Plugins/Instruments:/home/joe/Recording/Plugins/Effects

# Aliases
alias shs='python -m SimpleHTTPServer'
alias m='make 2>&1 | highlight-gcc'
alias ml='m | less -r'
alias screen='tmux'
alias git='hub'
alias grep='grep --color=always'
alias ls='ls --color=always'
alias less='less -R'
alias rgrep='grep -r'
alias thirty='termdown -b -s 30m'
alias twenty='termdown -b -s 20m'
alias fifteen='termdown -b -s 15m'
alias ten='termdown -b -s 10m'
alias five='termdown -b -s 5m'
alias hdprocessing='ffmpeg -r 60 -y -i screen-%*.tif -pass 1 -vcodec libx264 -preset slow -b:v 10000k -r 30 -pix_fmt yuv420p -f mp4 -an /dev/null && ffmpeg -r 60 -i screen-%*.tif -pass 2 -vcodec libx264 -preset slow -b:v 10000k -r 30 -pix_fmt yuv420p processing.mp4 && rm ffmpeg2pass*'
alias eli='sudo sshfs joe@192.168.0.20:/home/joe /mnt/eli -C -o allow_other,follow_symlinks'
alias swedish='setxkbmap se'
alias english='setxkbmap gb'
# Thinkful aliases
source ~/.bashrc.thinkful > /dev/null 2>&1

# Rest calls
curlget() {
    curl $1 "${@:2}"
}

curlpost() {
    curl -X POST -H "Content-Type: application/json" -d "$2" "$1" "${@:3}"
}

curlput() {
    curl -X PUT -H "Content-Type: application/json" -d "$2" "$1" "${@:3}"
}

curldelete() {
    curl -X DELETE $1 "${@:2}"
}

curlpatch() {
    curl -X PATCH -H "Content-Type: application/json" -d "$2" "$1" "${@:3}"
}

# Utils
youtube-dl-playlist() {
    youtube-dl --extract-audio --audio-format mp3 -o "%(autonumber)s-%(title)s.%(ext)s" --autonumber-size 2 "$@"
}

rgrepvim() {
    vim $(grep --color=none -rIl ${@:1})
}

diffsections() {
  local fname=`basename $2`;
  local tempfile=`mktemp -t $fname.XXX`;
  head -$6 $2 | tail -n +$5 > $tempfile && head -$4 $1 | tail -n +$3 | diff -u $tempfile - ;
  rm $tempfile;
}

source ~/apps/nvm/nvm.sh

# added by travis gem
[ -f /home/joe/.travis/travis.sh ] && source /home/joe/.travis/travis.sh

# Disable Ctrl-S in terminals
stty -ixon

# added by pipsi (https://github.com/mitsuhiko/pipsi)
export PATH="$PATH:/home/joe/.local/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
