
# Get the common bash configuration
  source ~/.common.bash

# Configure for Ubuntu
  export PS1="$BGreen>>ubuntu@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/bin/nano

  alias open='xdg-open'

# Set Path and other environment variables
  # Configure Python Virtual Environment
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Development
  source /home/raf/.local/bin/virtualenvwrapper.sh

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

  # runtime libs
  LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
  
  export PATH
  export LD_LIBRARY_PATH
