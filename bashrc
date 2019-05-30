export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{.git,node_modules,deps,_build,.elixir_ls}/*"'
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias edup="nvim +:PlugUpgrade +:PlugUpdate +:qall"
alias g="hub"
alias v="nvim"
alias ll="exa -lh"
alias la="ll -a"
alias dbup="pg_ctl -D /usr/local/var/postgres start"
alias weather="curl wttr.in"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

