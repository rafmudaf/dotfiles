# source global definitions
  if [ -f /etc/profile ]; then
    . /etc/profile
  fi

# Configure the shell environment
  source ~/.colors.bash
  export PS1="$BGreen>>\u@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BBlack\$ $Color_Off"
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
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias x='open -a Xcode'                     # x file:       Opens an ascii text file in Xcode
  alias pdf='open -a Preview' 
  tcp () { echo -n $1 | pbcopy; }
  alias fseagle='sshfs eagle:/home/rmudafor/Development/openfast_performance eagle/'
  sudome() { sudo dscl . append /Groups/admin GroupMembership `whoami`; }

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
  PATH="/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}"
  DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}"

  # OpenCV
  PATH="/usr/local/Cellar/opencv/2.4.13.1/include/opencv2${PATH:+:${PATH}}"

  # ImageMagick
  export DISPLAY=:0
  PATH="/usr/local/Cellar/imagemagick/6.9.7-0/bin:$PATH"
  DYLD_LIBRARY_PATH="/usr/local/Cellar/imagemagick/6.9.7-0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}"

  # swift env
  export SWIFTENV_ROOT="$HOME/.swiftenv"
  export PATH="$SWIFTENV_ROOT/bin:$PATH"
  eval "$(swiftenv init -)"

  # latex
  PATH="/usr/local/texlive/2018/bin/x86_64-darwin:$PATH"

  export PATH
