# lsd overides for ls
LS_COMMAND=$($(command -v lsd &> /dev/null) && echo 'lsd' || echo 'ls')
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls="$LS_COMMAND -F"
alias l="$LS_COMMAND -lAFth"
alias ll="$LS_COMMAND -l"
alias la="$LS_COMMAND -A"
alias lt="$LS_COMMAND -A --tree"

alias reload!='. ~/.zshrc'
