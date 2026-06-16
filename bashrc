case $- in
    *i*) ;;
      *) return;;
esac

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# export NVM_DIR="$HOME/.nvm" CAUSED ERROR
export NVM_DIR="$(readlink -f $HOME)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# +-------------------------------------------------------------------+ #


# export PYENV_HOME="$HOME/.pyenv"

# export PATH="$PATH:/usr/local/go/bin:/home/lqd0f/ghidra_11.3.2_PUBLIC/ghidraRun:$HOME/go/bin/:$PYENV_ROOT/bin:$JAVA_ROOT/bin"

addPath(){
	case ":$PATH:" in
		*":$1:"*) ;;
		*) export PATH="$1:$PATH" ;;
	esac
}

export PNPM_HOME="/home/lqd0f/.local/share/pnpm"
# export JAVA_HOME="$HOME/jdk-21.0.7+6"

addPath "/usr/local/go/bin"
addPath "$HOME/ctf/good2ls/ghidra_12.1_PUBLIC/ghidraRun"
addPath "$HOME/go/bin"
addPath "$PYENV_HOME/bin"
# addPath "$JAVA_HOME/bin"
addPath "usr/lib/dart/bin"
addPath "$HOME/flutter/bin"
addPath "$PNPM_HOME"
# addPath "$HOME/.cargo/env"

# eval "$(pyenv init --path)"

# +-------------------------------------------------------------------+ #


# .:.:.:.:. #
# :       : #
# . ALIAS . #
# :       : #
# .:.:.:.:. #

alias vi='vi'
alias vim='vim'

alias sl='ls'
alias s='ls'
alias l='ls'

alias scd='cd'

alias rmzz='rm *Zone*Identifier'
alias ctfi='mkdir bix && mkdir cry && mkdir frn && mkdir mis && mkdir nwk && mkdir osi && mkdir pwn && mkdir rev && mkdir web'

alias hi='history'

alias targz?='echo "base64 -d FILENAME.tar.gz.b64 | tar -xvzf -  >E(+0+ )3"'

mkdirAndCd(){
  mkdir $1 && cd $1
}
alias mdcd='mkdirAndCd'

alias drun='source ~/dlang/dmd-2.111.0/activate'
alias deac='deactivate'

# For kyopro

alias ccc='cd && cd ~/kyopro/atcoder/cpp' 
alias ccv='cd && cd ~/kyopro/atcoder/cpp && vim koala.cpp'

alias ddd='cd && cd ~/kyopro/atcoder/dart' 
alias ggg='cd && cd ~/kyopro/atcoder/go' 

alias gpka='g++ -std=c++20 -D=__LOCAL -g koala.cpp -o AtCoder.exe && cp ./koala.cpp ~/SUBMIT/SubmitMe'
alias gpkb='g++ -std=c++20 -D=__LOCAL -g koblb.cpp -o AtCoder.exe && cp ./koblb.cpp ~/SUBMIT/SubmitMe'
alias gpkc='g++ -std=c++20 -D=__LOCAL -g koclc.cpp -o AtCoder.exe && cp ./koclc.cpp ~/SUBMIT/SubmitMe'
alias gpkd='g++ -std=c++20 -D=__LOCAL -g kodld.cpp -o AtCoder.exe && cp ./kodld.cpp ~/SUBMIT/SubmitMe'
alias gpke='g++ -std=c++20 -D=__LOCAL -g koele.cpp -o AtCoder.exe && cp ./koele.cpp ~/SUBMIT/SubmitMe'
alias gpkf='g++ -std=c++20 -D=__LOCAL -g koflf.cpp -o AtCoder.exe && cp ./koflf.cpp ~/SUBMIT/SubmitMe'
alias gpkg='g++ -std=c++20 -D=__LOCAL -g koglg.cpp -o AtCoder.exe && cp ./koglg.cpp ~/SUBMIT/SubmitMe'
alias gpkh='g++ -std=c++20 -D=__LOCAL -g heuristic.cpp -o AtCoder.exe && cp ./heuristic.cpp ~/SUBMIT/SubmitMe'
alias gpkp='g++ -std=c++20 -D=__LOCAL -g pck.cpp -o AtCoder.exe && cp ./pck.cpp ~/SUBMIT/SubmitMe'

alias cl='cat ~/SUBMIT/SubmitMe | iconv -t sjis | clip.exe'

copy2ClipBoard(){
	cat ./$1 | iconv -t sjis | clip.exe
}
alias fcop='copy2ClipBoard'

alias pet='./AtCoder.exe'

#天ぷらを一括コピーするワンライナー
alias alcl='for file in ko?l?.cpp; do cp ./templa $file; done'

#C問題ガチャ用に書いた．
alias cgachac='gcc ./random_Cploblem.c -o cMondaiGacha.exe'
alias cgacha='./cMondaiGacha.exe'

# +-------------------------------------------------------------------+ #


alias ghidra='~/ctf/good2ls/ghidra_12.1_PUBLIC/ghidraRun'

alias flutter-win='cmd.exe /c C:\\\\src\\\\flutter\\\\bin\\\\flutter.bat'

# +-------------------------------------------------------------------+ #


export PS1="{\[\e[38;2;0102;0234;0252m\]\u\[\e[00m\]}@[\[\e[38;2;0102;0168;0252m\]\w\[\e[00m\]]\n\[\e[38;2;0204;0204;0204m\]E\[\e[00m\]\[\e[48;2;0138;0138;0138m\]\[\e[38;2;0006;0006;0006m\]( *@*)\[\e[00m\]\[\e[38;2;0204;0204;0204m\]3\[\e[00m\]\[\e[38;2;0252;0252;0252m\].oO(\[\e[00m\] "

# +-------------------------------------------------------------------+ #
