# source global definitions
  if [ -f /etc/profile ]; then
    . /etc/profile
  fi

# Get the common bash configuration
  source ~/.common.bash

# Configure for my MBP
  export PS1="$BGreen>>\u@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BBlack\$ $Color_Off"
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
  alias x='open -a Xcode'                     # x file:       Opens an ascii text file in Xcode
  alias pdf='open -a Preview' 
  tcp () { echo -n $1 | pbcopy; }

  # web server
  alias startvnc='vncserver :4 -geometry 2400x1500 -depth 24'
  alias startmysql='sudo launchctl load -F  /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
  alias stopmysql='sudo launchctl unload -F  /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'

# Set Path and Environment Variables
  # Configure Python Virtual Environment
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export WORKON_HOME=$HOME/.virtualenvs   # optional
  export PROJECT_HOME=$HOME/Development   # optional
  source /usr/local/bin/virtualenvwrapper.sh

  # my custom utilities
  PATH="/Users/raf/Development/utilities:$PATH"

  # homebrew path setup
  PATH="/usr/local/sbin:$PATH"
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

  # CUDA
  PATH="/Developer/NVIDIA/CUDA-8.0/bin:$PATH"
  DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-8.0/lib:$DYLD_LIBRARY_PATH"

  # OpenCV
  PATH="/usr/local/Cellar/opencv/2.4.13.1/include/opencv2:$PATH"

  # ImageMagick
  export DISPLAY=:0
  PATH="/usr/local/Cellar/imagemagick/6.9.7-0/bin:$PATH"
  DYLD_LIBRARY_PATH="/usr/local/Cellar/imagemagick/6.9.7-0/lib:$DYLD_LIBRARY_PATH"

  # swift env
  export SWIFTENV_ROOT="$HOME/.swiftenv"
  export PATH="$SWIFTENV_ROOT/bin:$PATH"
  eval "$(swiftenv init -)"

  # latex
  PATH="/usr/local/texlive/2018/bin/x86_64-darwin:$PATH"

  export PATH

  export BASH_SILENCE_DEPRECATION_WARNING=1
