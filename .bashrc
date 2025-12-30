# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# pnpm
export PNPM_HOME="/home/lqd0f/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "$HOME/.cargo/env"
export PATH="$PATH:/usr/lib/dart/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# JDK
# JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
JAVA_HOME="/home/lqd0f/jdk-21.0.7+6"
export JAVA_HOME
# PATH=$PATH:$JAVA_HOME/bin
PATH="$JAVA_HOME/bin:$PATH"
export PATH

# +-------------------------------------------------------------------+ #


# IOIOIOIOIOIOI #
# I           I #
# I  ARCHIVE  I #
# I           I #
# IOIOIOIOIOIOI #

#shortcut
alias ojt='oj t -c "cppAtCoder tenpura.cpp" -d test'

downloadAtCoder()
{
 acc new abc$1 && cd abc$1/a && vim koala.cpp
}
alias gett='downloadAtCoder'

cdVimTessoku()
{
 cd ~/kyopro/atcoder/tanren/teSSoku/$1 && v
}
alias tess='cdVimTessoku'

alias jcm='javac Main.java'
alias vmj='vim Main.java'
alias jet='java Main'

alias jjj='cd &&cd ~/kyopro/javAtCoder/reuser &&echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHHHHHHHH..HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHHHHHHHHH.....HHH.....HHHHHHHHHHHHHHHH.HH.HHHHHHHH........HHHHH.HHH.HHH.HHHHHH.HHH.H..HHHHHHHHHHHHHHHHHH.H.HHHHH.H.HHHHHHHHHH.....HH.HH.HH......HHHHHHHH.HHHH.HHH.HHH.HH.HH...HH..HH.HHHHHHHHHHHHHHHH.....HHH.....HHHH.....HHHHH.HH..HHH.HHHHHHHHHHHHH.HHHHH.H.H.H.HHH.HHH.HHH.HHH.HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH..HHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHH.HHHHHH.HHH.HHHH.HHH.HHH.HHH.HHHHHHHHHHHHHHHHH....HHH.....HHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH.HHH.HHH.HHH.HHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHH.HHHHHHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHHHHHHHH....HHHHH...HHHHHHHHHHHHHH.HHHHHHHH.HHHHHHHHHHHH.HHHHHHHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHHHHHHHHH.H.HHHHH.H.HH.HHHHHHHHHH.HHHHHHHHH.HHHHHHHHHHHH.HHHHHHHHHHHHHHHHHH.HHH...HHHH.HHH.HHH...HHHHHH.H.H.HH.HH.HH.HHHHHHHHH.HHHHHHHHHHH.HHHHHHHHHHH.HHHHHHHHHHHHHH.HHH.HH.HHH.HHH.HHH.HH.HHH.HHHH.HH..HH.HHH...HHHHHHH..HHHHHHHHHHHHHH...........HHHHHHHHHHHHHHH.HHH.HH.HHH.HHHH.H.HHH.HHH.HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH...HHHH...H.HHHH.HHHHH...H.HH'
alias jjv='cd &&cd ~/kyopro/javAtCoder/reuser &&vim Main.java'
# &&echo HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHHHHHHHH..HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHHHHHHHHH.....HHH.....HHHHHHHHHHHHHHHH.HH.HHHHHHHH........HHHHH.HHH.HHH.HHHHHH.HHH.H..HHHHHHHHHHHHHHHHHH.H.HHHHH.H.HHHHHHHHHH.....HH.HH.HH......HHHHHHHH.HHHH.HHH.HHH.HH.HH...HH..HH.HHHHHHHHHHHHHHHH.....HHH.....HHHH.....HHHHH.HH..HHH.HHHHHHHHHHHHH.HHHHH.H.H.H.HHH.HHH.HHH.HHH.HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH..HHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHH.HHHHHH.HHH.HHHH.HHH.HHH.HHH.HHHHHHHHHHHHHHHHH....HHH.....HHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH.HHH.HHH.HHH.HHHHHHHHHHHHHH.HHHHHHH.HHHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHH....HHHHHHHHHHHHHHHHHHHH....HHHHH...HHHHHHHHHHHHHH.HHHHHHHH.HHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHH.HHHH.HHHHH.HHHHHH.HHHHHHH.H.HHHHH.H.HH.HHHHHHHHHH.HHHHHHHHH.HHHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHH.HHHHHHHH.....HH.....HHHHH.H.H.HH.HH.HH.HHHHHHHHH.HHHHHHHHHHH.HHHHHHHHHHH.HHHHHHHHHHHHHHHHHHHH.HHHH.HHHHH.HHHHHH.HHHHHH.HH..HH.HHH...HHHHHHH..HHHHHHHHHHHHHH...........HHHHHHHHHHHHHHHHHHHHHH....HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH'

# +-------------------------------------------------------------------+ #


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/Lqd0f/ghidra_11.3.2_PUBLIC/ghidraRun
#export PATH=$PATH:/home/Lqd0f/dlang/dmd-2.111.0/activate
export PATH=$PATH:$HOME/go/bin

export FLUTTER_ROOT=$HOME/flutter
export PATH="$HOME/flutter/bin:$PATH"

# +-------------------------------------------------------------------+ #


# .:.:.:.:. #
# :       : #
# . ALIAS . #
# :       : #
# .:.:.:.:. #

alias vi='vi'
alias vim='vim';

alias sl='ls'
alias s='ls'
alias l='ls'

mkdirAndCd()
{
  mkdir $1 && cd $1
}
alias mdcd='mkdirAndCd'

alias drun='source ~/dlang/dmd-2.111.0/activate'
alias deac='deactivate'

# For kyopro

alias ccc='cd && cd ~/kyopro/atcoder/cpp' 
alias ccv='cd && cd ~/kyopro/atcoder/cpp && vim koala.cpp'

alias gpka='g++ -std=c++20 -D=__LOCAL -g koala.cpp -o AtCoder.exe &&cp ./koala.cpp ~/SUBMIT/SubmitMe'
#alias gpka='g++ -std=c++20 -D=__LOCAL -g pck.cpp -o AtCoder.exe &&cp ./pck.cpp ~/SUBMIT/SubmitMe'
alias gpkb='g++ -std=c++20 -D=__LOCAL -g koblb.cpp -o AtCoder.exe &&cp ./koblb.cpp ~/SUBMIT/SubmitMe'
alias gpkc='g++ -std=c++20 -D=__LOCAL -g koclc.cpp -o AtCoder.exe &&cp ./koclc.cpp ~/SUBMIT/SubmitMe'
alias gpkd='g++ -std=c++20 -D=__LOCAL -g kodld.cpp -o AtCoder.exe &&cp ./kodld.cpp ~/SUBMIT/SubmitMe'
alias gpke='g++ -std=c++20 -D=__LOCAL -g koele.cpp -o AtCoder.exe &&cp ./koele.cpp ~/SUBMIT/SubmitMe'
alias gpkf='g++ -std=c++20 -D=__LOCAL -g koflf.cpp -o AtCoder.exe &&cp ./koflf.cpp ~/SUBMIT/SubmitMe'
alias gpkg='g++ -std=c++20 -D=__LOCAL -g koglg.cpp -o AtCoder.exe &&cp ./koglg.cpp ~/SUBMIT/SubmitMe'
alias gpkh='g++ -std=c++20 -D=__LOCAL -g heuristic.cpp -o AtCoder.exe &&cp ./heuristic.cpp ~/SUBMIT/SubmitMe'

alias cl='cat ~/SUBMIT/SubmitMe | iconv -t sjis | clip.exe'
#alias cl='cat ./pck.cpp | iconv -t sjis | clip.exe'

alias pet='./AtCoder.exe'

#天ぷらを一括コピーするfor文をワンライナーで書いた
alias alcl='for file in ko?l?.cpp; do cp ./templa $file; done'

#C問題ガチャ用に書いた．
alias cgachac='gcc ./random_Cploblem.c -o cMondaiGacha.exe'
alias cgacha='./cMondaiGacha.exe'

##########################################################################

alias ghidra='~/ghidra_11.3.2_PUBLIC/ghidraRun'

#For Deveropment with Flutter

alias flutter-win='cmd.exe /c C:\\\\src\\\\flutter\\\\bin\\\\flutter.bat'

##########################################################################

#export PS1='\u@{\w} E( *O*)3 <'
#export PS1="\[\e[0;34m\]\u\[\e[m\]@{\[\e[0;34m\]\w\[\e[m\]}\nE( *O*)3.oO( "
export PS1="\[\e[38;2;0102;0234;0252m\]\u\[\e[00m\]@{\[\e[38;2;0234;0252;0102m\]\w\[\e[00m\]}\n\[\e[38;2;0204;0204;0204m\]E\[\e[00m\]\[\e[48;2;0138;0138;0138m\]\[\e[38;2;0006;0006;0006m\]( *@*)\[\e[00m\]\[\e[38;2;0204;0204;0204m\]3\[\e[00m\]\[\e[38;2;0252;0252;0252m\].oO(\[\e[00m\] "

##########################################################################


