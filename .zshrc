# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export PATH="$HOME/.juliaup/bin:$PATH"
export PATH="/Applications/quarto/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
#export PATH="/Library/TeX/texbin:$PATH"
#
# export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/Users/raoulgrouls/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin:/Users/raoulgrouls/.vscode/extensions/rust-lang.rust-analyzer-0.3.1170-darwin-arm64/server:$PATH"
export ZSH=~/.oh-my-zsh

plugins=(
  	git
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

alias gs="git status"
alias gg="git-graph"
alias hg="history | rg "
alias code="code ."
alias gs="git status"
alias history='omz_history -E'
alias lsd='exa -h --icons --long --sort=mod'
alias lsf='du -sh ./* | sort -hr'
alias peek="tree -L 2 "
alias rm="rip"

export PYTHONPATH=""

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"	
export PTPYTHON_CONFIG_HOME="$HOME/.config/ptpython"
# export PATH="$HOME/.pyenv/shims/$PATH"

eval "$(pyenv init -)"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/raoulgrouls/code/UM_stock/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/raoulgrouls/code/UM_stock/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/raoulgrouls/code/UM_stock/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/raoulgrouls/code/UM_stock/google-cloud-sdk/completion.zsh.inc'; fi
