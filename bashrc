# Git prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
TXT_WHITE=$(tput setaf 7)
TXT_RED=$(tput setaf 1)
TXT_YELLOW=$(tput setaf 3)
TXT_GREEN=$(tput setaf 2)
TXT_BOLD=$(tput bold)
TXT_RESET=$(tput sgr0)
PS1='${debian_chroot:+($debian_chroot)}\
\[$TXT_RED\]\u \
\[$TXT_WHITE\][\
\[$TXT_BOLD\]\[$TXT_YELLOW\]\w\
\[$TXT_RESET\]\[$TXT_WHITE\]] $(parse_git_branch) \n\
\[$TXT_BOLD\]\[$TXT_GREEN\]\h\
\[$TXT_RESET\]\$ '

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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PATH="$PATH:$HOME/bin"
export DEBFULLNAME='Nicolas Valcárcel Scerpella'
export DEBEMAIL=''
export DEBSIGN_KEYID='EF584970'
export TERM='xterm'
export EDITOR='vim'
export PYTHONSTARTUP=~/.pythonrc
export HISTSIZE=1000
export HISTFILESIZE=1000

export GIT_AUTHOR_NAME='Nicolas Valcárcel Scerpella'
export GIT_COMMITTER_NAME='Nicolas Valcárcel Scerpella'
export GIT_COMMITTER_EMAIL=
export GIT_AUTHOR_EMAIL=
