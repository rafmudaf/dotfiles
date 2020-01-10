
# Common bash configurations

# Configure the shell environment
  source ~/.colors.bash
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export BLOCKSIZE=1k # Set default units when ls, df, du display object size

# source git specific bash scripts
  source ~/.git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=yes
  export GIT_PS1_SHOWSTASHSTATE=yes

# Aliases and Functions
  alias la='ls -a'
  alias ll='ls -lht'
  alias ~="cd ~"                              # ~:            Go Home
  alias c='clear'                             # c:            Clear terminal display
  alias which='type -all'                     # which:        Find executables
  alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
  alias wget='wget --no-check-certificate'
  alias grep='grep --color=auto'
  printpath(){ sed 's/:/\n/g' <<< "$PATH"; }
  printlist(){ sed 's/:/\n/g' <<< "$1"; }

  # docker cli
  dockerbash() { docker run -it $1 /bin/bash; }
