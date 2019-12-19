export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{.git,node_modules,deps,_build,.elixir_ls}/*"'
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.asdf/installs/lua/5.3.5/luarocks/bin:$PATH"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig

alias edup="nvim +:PlugUpgrade +:PlugUpdate +:qall"
alias g="hub"
alias v="nvim"
alias ll="exa -lh"
alias la="ll -a"
alias dbup="pg_ctl -D /usr/local/var/postgres start"
alias weather="curl wttr.in"
alias gc='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


[ -s "/Users/taylor/.jabba/jabba.sh" ] && source "/Users/taylor/.jabba/jabba.sh"
