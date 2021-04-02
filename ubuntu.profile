
# Get the common bash configuration
  source ~/.common.bash

# Configure for Ubuntu
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/bin/nano

  alias open='xdg-open'

# Set Path and other environment variables

  # intel tools
  inteltools() {
    source /opt/intel/oneapi/setvars.sh   
    export FC=/opt/intel/oneapi/compiler/latest/linux/bin/intel64/ifort
  }
  
  # gnu tools - use these as default
  gnutools() {
    export FC=/usr/bin/gfortran-10
  }
  gnutools

  # my custom code utilities
  PATH="$HOME/Development/utils/:$PATH"

  # runtime libs
  LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
  
  export PATH
  export LD_LIBRARY_PATH
