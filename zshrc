# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/.config/zsh/zshrc.head

# PCO
source $HOME/.config/zsh/zshrc.work

# MAIN
source $HOME/.config/zsh/zshrc.main

# User configuration
source $HOME/.config/zsh/zshrc.user

# Tail
source $HOME/.config/zsh/zshrc.tail
export RBENV_ROOT=$HOME/.rbenv
export MYSQL_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_READER_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_READER_PORT_3306_TCP_PORT=3307

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
