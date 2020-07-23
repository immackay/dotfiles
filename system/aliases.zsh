# lsd overides for ls
if $(lsd &>/dev/null)
then
  alias cp='cp -iv'
  alias mv='mv -iv'
  alias mkdir='mkdir -pv'
  alias ls="lsd -F"
  alias l="lsd -lAFth"
  alias ll="lsd -l"
  alias la='lsd -A'
  alias lt="lsd -A --tree"
fi
