# source global definitions
  if [ -f /etc/profile ]; then
    . /etc/profile
  fi

# Get the common bash configuration
  source ~/.common.bash

# Configure for NREL MBP
  export PS1="$BGreen>>mbp@$BCyan\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/usr/bin/nano

  # add color to terminal, from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad

  # source git specific bash scripts
  # installed with git from homebrew at
  #  /usr/local/etc/bash_completion.d/git-completion.bash
  #  /usr/local/etc/bash_completion.d/git-prompt.sh
  source ~/.git-completion.bash

  # mac-specific aliases and functions
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias pdf='open -a Preview' 
  tcp () { echo -n $1 | pbcopy; }
  alias fseagle='sshfs eagle:/home/rmudafor/Development/openfast_performance eagle/'
  sudome() { sudo dscl . append /Groups/admin GroupMembership `whoami`; }

  # openfast
  countOF(){ grep -rn "OpenFAST terminated normally." . | wc -l; }
  printrtest(){ echo "git clone -b <branch> --recursive https://github.com/<fork>/openfast && cd openfast && mkdir build && cd build && cmake .. -DBUILD_TESTING=ON -DBUILD_SHARED_LIBS=ON && make -j 8 install && ctest -j 8"; }

  # mbdyn
  confmbd() { ./configure --enable-runtime-loading --with-module="kitefastmbd"; }
  cleanmbd() { rm *.out *.ine *.jnt *.log *.mov *.act *.frc *.sum *.bylog *.csv *.ech *.V*i *.A*i; }
  cleanpre() { rm *.beam *.body *.nodes *.structural *.elements KiteMain*; }
  alias mbdpre='python3 /Users/rmudafor/Development/makani/sandbox/glue-codes/kitefast/preprocessor/preprocess.py'
  alias kitemain='/usr/local/mbdyn/bin/mbdyn KiteMain.mbd'

# Set Path and Environment Variables
  # conda setup
  condasetup() {
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
  }
  condasetup

  # intel tools
  inteltools() {
    source /opt/intel/bin/debuggervars.sh
    source /opt/intel/bin/compilervars.sh intel64
    source /opt/intel/mkl/bin/mklvars.sh intel64 mod
    export MKLROOT=/opt/intel/compilers_and_libraries/mac/mkl
    export FC=/usr/local/bin/ifort
  }
  
  # gnu tools - use these as default
  gnutools() {
    # gcc 7 is now gcc@7 in homebrew so it does not link to gcc and gfortran
    # thus, export the FC variable
    export FC=/usr/local/bin/gfortran
  }

  # Homebrew path setup
  # Brew's make and sed are higher version than mac's
  PATH="/usr/local/sbin:$PATH"
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
  PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

  # my custom code utilities
  PATH="/Users/rmudafor/Development/utilities:$PATH"

  # swift - add xcode tools to path
  PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  export PATH

  # Silences the macOS warning to update to ZSH
  export BASH_SILENCE_DEPRECATION_WARNING=1
