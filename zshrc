# begin
[ -r ~/.zsh_private ] && source ~/.zsh_private
[ -r ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -r ~/.funcs.zsh ] && source ~/.funcs.zsh
[ -r ~/.git.zsh ] && source ~/.git.zsh
[ -f ~/.z.lua ] && eval "$(lua ~/.z.lua  --init zsh once enhanced)"

export GO111MODULE=on
export GOPROXY=https://goproxy.cn

export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/usr/local/sbin:$PATH"
export COMSPEC=xxxxx

# git autocomplete supplied by zsh
autoload -U compinit; compinit

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -d $PYENV_ROOT/bin ] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# auto active virtualenv
eval "$(pyenv virtualenv-init -)"
