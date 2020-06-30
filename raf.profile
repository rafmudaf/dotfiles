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
  alias pdf='open -a Preview' 
  tcp () { echo -n $1 | pbcopy; }

  # web server
  alias startvnc='vncserver :4 -geometry 2400x1500 -depth 24'
  alias startmysql='sudo launchctl load -F  /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
  alias stopmysql='sudo launchctl unload -F  /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'

# Set Path and Environment Variables
  # conda setup
  condasetup() {
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/raf/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/raf/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/raf/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/raf/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
  }
  condasetup

  # my custom utilities
  PATH="/Users/raf/Development/utilities:$PATH"

  # Homebrew path setup
  # Brew's make and sed are higher version than mac's
  PATH="/usr/local/sbin:$PATH"
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
  PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

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

  export PATH

  # Silences the macOS warning to update to ZSH
  export BASH_SILENCE_DEPRECATION_WARNING=1
