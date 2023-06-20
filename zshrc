# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=7

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(composer git git-extras z)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export DISABLE_AUTO_TITLE='true'

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# ALIASES
# Misc.
alias df='df --human-readable'
alias du='du --human-readable'
alias grep='grep --color=auto'
alias less='less --quiet'

# Tmux
alias tmuxi="tmuxinator"

# Copy/paste clipboard pipe
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Fetch hacker news
alias hn="hn -k"

# Dotfiles
alias confhosts="sudo vim $HOSTSPATH"
alias conftmux="vim $DOTPATH/.tmux.conf"
alias confvim="vim $DOTPATH/.vimrc"
alias confzsh="vim $DOTPATH/.zshrc"

# ls
alias ldir="ls -d .*/ */"
alias lfile="find . -maxdepth 1 -type f"
alias lfile="ls -a -l | grep -v '^d'"
alias ls="ls --color"
alias fdir="find ~ -name"

# Git
alias gnochange="git ls-files -v | grep '^[[:lower:]]'"
alias gset-nochange="git update-index --assume-unchanged"
alias gunset-nochange="git update-undex --no-assume-unchanged"
unalias gcm
alias gcmaster="git checkout master"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
