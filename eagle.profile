# Configure the shell environment
  source ~/.colors.bash
  export PS1="$BGreen>>eagle@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/usr/bin/nano
  export BLOCKSIZE=1k # Set default blocksize for ls, df, du, from this: http://hints.macworld.com/comment.php?mode=view&cid=24491

# source git specific bash scripts
  source ~/.git-prompt.sh        # /usr/share/doc/git-1.8.3.1/contrib/completion/git-prompt.sh
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
  printlist(){ sed 's/:/\n/g' <<< "$1"; }

  # specific to this computer
  alias open='xdg-open'

  # hpc
  alias anynode='srun --export=ALL -A hfm -t 04:00:00 --job-name=openfast_testing --ntasks=24 --pty bash'
  alias gpu='srun --export=ALL -A hfm -t 04:00:00 -p=gpu --job-name=openfast_testing --ntasks=24 --pty bash'
  alias jobs='qstat -u rmudafor'

  # intel tools
  alias vtune='amplxe-gui'
  alias advisor='advixe-gui'

# Set Path and Environment Variables
  # my custom code utilities
  PATH="/home/rmudafor/Development/utils/:$PATH"

  # OPENFAST
  PATH="/home/rmudafor/Development/openfast/build/glue-codes/openfast:/home/rmudafor/Development/openfast/build/modules/beamdyn:$PATH"

  export PATH

# Module configuration
  _commonmodules() {
    module load cmake/3.12.3
    module load conda/5.3
    source activate openfast
  }

  gnumodules() {
    # module use /nopt/nrel/ecom/ecp/base/modules/gcc-6.2.0/
    module purge
    _commonmodules
    #module load netlib-lapack/3.8.0
    module load gcc/7.3.0
  }

  intelmodules() {
    module purge
    _commonmodules
    module load comp-intel/2018.0.3
    module load mkl/2018.3.222
  }

  # load the intel modules by default
  intelmodules
