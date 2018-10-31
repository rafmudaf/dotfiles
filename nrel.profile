# source global definitions
  if [ -f /etc/profile ]; then
    . /etc/profile
  fi

# Configure the shell environment
  export PS1='mbp@\w$(__git_ps1 " (%s)")\$ '
  export EDITOR=/usr/bin/nano
  export BLOCKSIZE=1k # Set default blocksize for ls, df, du, from this: http://hints.macworld.com/comment.php?mode=view&cid=24491

  # add color to terminal, from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad

# source git specific bash scripts
  source ~/.git-completion.bash  # installed with git from homebrew at /usr/local/etc/bash_completion.d/git-completion.bash
  source ~/.git-prompt.sh        # installed with git from homebrew at /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=yes
  export GIT_PS1_SHOWSTASHSTATE=yes

# Aliases and Functions
  alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -lht'
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias x='open -a Xcode'                     # x file:       Opens an ascii text file in Xcode
  alias pdf='open -a Preview'
  alias ~="cd ~"                              # ~:            Go Home
  alias c='clear'                             # c:            Clear terminal display
  alias which='type -all'                     # which:        Find executables
  alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
  alias show_options='shopt'                  # Show_options: display bash options settings
  alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
  alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
  alias wget='wget --no-check-certificate'
  tcp () { echo -n $1 | pbcopy; }
  printpath(){ sed 's/:/\n/g' <<< "$PATH"; }
  mans () { man $1 | grep -iC2 --color=always $2 | less; } # Search manpage given in agument '1' for term given in argument '2' (case insensitive) Example: mans mplayer codec
  sudome() { sudo dscl . append /Groups/admin GroupMembership `whoami`; }
  trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

  # openfast
  countOF(){ grep -rn "OpenFAST terminated normally." . | wc -l; }

  # mbdyn
  confmbd() { ./configure --enable-runtime-loading --with-module="kitefastmbd"; }
  cleanmbd() { rm *.out *.ine *.jnt *.log *.mov *.act *.frc *.sum *.bylog; }
  cleanpre() { rm *.beam *.nodes *.structural *.elements KiteMain*; }
  alias mbdpre='python /Users/rmudafor/Development/makani/KiteFAST/MBDYN/preprocessor/preprocess.py'
  alias pushgerrit='git push origin HEAD:refs/for/master'

# Environment Variables
  # gcc 7 is now gcc@7 in homebrew so it does not link to gcc and gfortran
  # thus, export the FC variable
  export FC=/usr/local/bin/gfortran-7

  # Homebrew GitHub access token
  export HOMEBREW_GITHUB_API_TOKEN=""

  # Configure Python Virtual Environment
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export WORKON_HOME=$HOME/.virtualenvs   # optional
  export PROJECT_HOME=$HOME/projects      # optional
  source /usr/local/bin/virtualenvwrapper.sh

  # intel tools
  source /opt/intel/debugger_2018/bin/debuggervars.sh
  source /opt/intel/bin/compilervars.sh intel64
  export MKLROOT=/opt/intel/compilers_and_libraries/mac/mkl

  # emscripten
  #source /Users/rmudafor/Development/emsdk/emsdk_env.sh

# Set Path
  PATH="/usr/local:/usr/local/sbin:$PATH"

  # my custom code utilities
  PATH="/Users/rmudafor/Development/utils/:$PATH"

  # swift - add xcode tools to path
  PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/:$PATH"

  # OPENFAST
  PATH="/Users/rmudafor/Development/openfast/build/glue-codes/openfast:/Users/rmudafor/Development/openfast/build/modules-local/beamdyn:$PATH"

  # MAP++
  DYLD_LIBRARY_PATH="/Users/rmudafor/Desktop/MAP_v1.20.10/src${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  # intel tools
  PATH="/opt/intel/parallel_studio_xe_2018/debugger_2018/gdb/intel64/bin:$PATH"

  export PATH
