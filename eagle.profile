
# Configure the shell environment
  source ~/.colors.bash
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/usr/bin/nano
  export BLOCKSIZE=1k # Set default blocksize for ls, df, du, from this: http://hints.macworld.com/comment.php?mode=view&cid=24491

# source git specific bash scripts
  source ~/.git-prompt.sh        # /usr/share/doc/git-1.8.3.1/contrib/completion/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=yes
  export GIT_PS1_SHOWSTASHSTATE=yes

# Aliases and Functions
  alias open='xdg-open'
  alias ~="cd ~"                              # ~:            Go Home
  alias c='clear'                             # c:            Clear terminal display
  alias which='type -all'                     # which:        Find executables
  alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
  alias show_options='shopt'                  # Show_options: display bash options settings
  alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
  alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
  alias wget='wget --no-check-certificate'
  alias grep='grep --color=auto'
  tcp () { echo -n $1 | pbcopy; }
  printpath(){ sed 's/:/\n/g' <<< "$PATH"; }
  mans () { man $1 | grep -iC2 --color=always $2 | less; } # Search manpage given in agument '1' for term given in argument '2' (case insensitive) Example: mans mplayer codec

# Environment Variables
  # default fortran compiler
  # export FC=/usr/bin/gfortran-7

  # Configure Python Virtual Environment
  #export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  #export WORKON_HOME=$HOME/.virtualenvs   # optional
  #export PROJECT_HOME=$HOME/projects      # optional
  #source /usr/local/bin/virtualenvwrapper.sh

# Set Path
  # my custom code utilities
  PATH="/home/rmudafor/Development/utils/:$PATH"

  # OPENFAST
  PATH="/home/rmudafor/Development/openfast/build/glue-codes/openfast:/home/rmudafor/Development/openfast/build/modules-local/beamdyn:$PATH"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  export PATH
