# Configure the shell environment
  source ~/.colors.bash
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/usr/bin/nano
  export BLOCKSIZE=1k # Set default blocksize for ls, df, du, from this: http://hints.macworld.com/comment.php?mode=view&cid=24491

# source git specific bash scripts
  source ~/.git-prompt.sh        # installed with git from homebrew at /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=yes
  export GIT_PS1_SHOWSTASHSTATE=yes

# Aliases and Functions
  alias ls='ls -G'
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

  # specific to this computer
  alias open='xdg-open'

# Set Path and Environment Variables
  # default fortran compiler
  export FC=/usr/bin/gfortran-7

  # get vtune environment
  source /opt/intel/vtune_amplifier_2019.0.2.570779/amplxe-vars.sh

  # my custom code utilities
  PATH="/home/raf/Development/utils/:$PATH"

  # OPENFAST
  PATH="/home/raf/Development/openfast/build/glue-codes/fast:/home/raf/Development/openfast/build/modules/beamdyn:$PATH"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  export PATH
