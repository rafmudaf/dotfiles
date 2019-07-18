# Configure the shell environment
  source ~/.colors.bash
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/bin/nano
  export BLOCKSIZE=1k # Set default blocksize for ls, df, du, from this: http://hints.macworld.com/comment.php?mode=view&cid=24491

# source git specific bash scripts
  source ~/.git-prompt.sh        # installed with git from homebrew at /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=yes
  export GIT_PS1_SHOWSTASHSTATE=yes

# Aliases and Functions
#   alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -lht'
  alias ~="cd ~"                              # ~:            Go Home
  alias c='clear'                             # c:            Clear terminal display
  alias which='type -all'                     # which:        Find executables
  alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
  alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
  alias wget='wget --no-check-certificate'
  alias grep='grep --color=auto'
  printpath(){ sed 's/:/\n/g' <<< "$PATH"; }
  printlist(){ sed 's/:/\n/g' <<< "$1"; }

  # specific to this computer
  alias open='xdg-open'

# Set Path and other environment variables
  # default fortran compiler
  export FC=/usr/bin/gfortran-7

  # intel developer tools
  source /home/raf/intel/parallel_studio_xe_2019/psxevars.sh

  # my custom code utilities
  PATH="/home/raf/Development/utils/:$PATH"

  # OPENFAST
  PATH="/home/raf/Development/openfast/build/glue-codes/fast:/home/raf/Development/openfast/build/modules/beamdyn:$PATH"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  # qt
  export Qt5_DIR="/usr/lib/x86_64-linux-gnu/"

  # runtime libs
  LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
  
  export LD_LIBRARY_PATH
  export PATH
