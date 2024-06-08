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

  # Source bash completions
  # These packages are installed with homebrew
  brewdir=/opt/homebrew
  # The git completions sourced above and in common.sh are handled
  # differently so that they work on all systems with these dotfiles.
  # This block of tools are not installed on all systems.
  source $brewdir/etc/bash_completion.d/brew
  source $brewdir/etc/bash_completion.d/cmake
  # source $brewdir/etc/bash_completion.d/ctest
  source $brewdir/etc/bash_completion.d/gh

  # mac-specific aliases and functions
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias pdf='open -a Preview' 
  tcp () { echo -n $1 | pbcopy; }
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
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/rmudafor/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/rmudafor/miniforge3/etc/profile.d/conda.sh" ]; then
            . "/Users/rmudafor/miniforge3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/rmudafor/miniforge3/bin:$PATH"
        fi
    fi
    unset __conda_setup

    if [ -f "/Users/rmudafor/miniforge3/etc/profile.d/mamba.sh" ]; then
        . "/Users/rmudafor/miniforge3/etc/profile.d/mamba.sh"
    fi
    # <<< conda initialize <<<
  }
  condasetup

  # intel tools
  inteltools() {
    source /opt/intel/oneapi/setvars.sh
    export MKLROOT=/opt/intel/oneapi/mkl/latest
    export FC=/usr/local/bin/ifort
    export CXX=/usr/local/bin/icpc
    export CC=/usr/local/bin/icc
    export CFLAGS=-I/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include
    export CPPFLAGS=$CFLAGS
    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include    
    export LIBRARY_PATH=$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib
  }

  # gnu tools - use these as default
  gnutools() {
    export FC=/opt/homebrew/bin/gfortran-13
    export CXX=/opt/homebrew/bin/g++-13
    export CC=/opt/homebrew/bin/gcc-13
  }
  # gnutools

  # llvm tools
  llvmtools() {
    export FC=/opt/homebrew/bin/gfortran-13
    export CXX=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++
    export CC=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
  }
  # llvmtools

  # Homebrew path setup
  # Brew's make and sed are higher version than mac's
  PATH="/usr/local/sbin:$PATH"
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
  PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  PATH="/usr/local/opt/gnu-time/libexec/gnubin:$PATH"

  # my custom code utilities
  PATH="/Users/rmudafor/Development/utilities:$PATH"

  # swift - add xcode tools to path
  PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  export PATH

  # Starting on macOS Catalina (10.15) the headers used for various system libraries have
  # been moved from their previous location. This can be solved by setting SDKROOT in
  # your shell configuration to the value provided by xcrun.
  export SDKROOT=$(xcrun --show-sdk-path)

  # Silences the macOS warning to update to ZSH
  export BASH_SILENCE_DEPRECATION_WARNING=1
