
# Get the common bash configuration
  source ~/.common.bash

# Configure for Ubuntu
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/bin/nano

  alias open='xdg-open'

# Set Path and other environment variables

  # intel tools
  inteltools() {
    source /opt/intel/debugger_2020/bin/debuggervars.sh
    source /opt/intel/bin/compilervars.sh intel64
    source /opt/intel/mkl/bin/mklvars.sh intel64 mod
    export MKLROOT=/opt/intel/compilers_and_libraries/linux/mkl
    export FC=/usr/bin/ifort

    # intel developer tools
    # source $HOME/intel/parallel_studio_xe_2019/psxevars.sh
  }
  
  # gnu tools - use these as default
  gnutools() {
    # gcc 7 is now gcc@7 in homebrew so it does not link to gcc and gfortran
    # thus, export the FC variable
    export FC=/usr/bin/gfortran-7
  }
  gnutools

  # my custom code utilities
  PATH="$HOME/Development/utils/:$PATH"

  # runtime libs
  LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
  
  export PATH
  export LD_LIBRARY_PATH
