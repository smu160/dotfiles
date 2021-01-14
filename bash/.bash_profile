if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Silence the warning that the default shell is now zsh on macOS Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/4113

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \t\a\]$PS1"
    ;;
*)
    ;;
esac

# Added for MacTeX
export PATH="$PATH:/usr/local/texlive/2020/bin/x86_64-darwin/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/saveliyyusufov/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/saveliyyusufov/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/saveliyyusufov/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/saveliyyusufov/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
