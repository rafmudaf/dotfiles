# source global definitions
if [ -f /etc/profile ]; then
  . /etc/profile
fi

# Configure the shell environment
  export PS1="\u@\W$ "
  export EDITOR=/usr/bin/nano
  export BLOCKSIZE=1k # Set default blocksize for ls, df, du http://hints.macworld.com/comment.php?mode=view&cid=24491

# Aliases and Functions
# Aliases and Functions
  alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -lht'
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias x='open -a Xcode'                     # x file:       Opens an ascii text file in Xcode
  alias pdf='open -a Preview'
  alias subl='open -a Sublime\ Text'
  alias ~="cd ~"                              # ~:            Go Home
  alias c='clear'                             # c:            Clear terminal display
  alias which='type -all'                     # which:        Find executables
  alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
  alias show_options='shopt'                  # Show_options: display bash options settings
  alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
  alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
  tcp () { echo -n $1 | pbcopy; }
  printpath(){ sed 's/:/\n/g' <<< "$PATH"; }
  mans () { man $1 | grep -iC2 --color=always $2 | less; } # Search manpage given in agument '1' for term given in argument '2' (case insensitive) Example: mans mplayer codec

  alias startmysql='sudo launchctl load -F  /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'
  alias stopmysql='sudo launchctl unload -F  /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist'

# Environment Variables
  # ImageMagick
  export DISPLAY=:0
  export DYLD_LIBRARY_PATH

  # Configure Python Virtual Environment
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export WORKON_HOME=$HOME/.virtualenvs   # optional
  export PROJECT_HOME=$HOME/projects      # optional
  source /usr/local/bin/virtualenvwrapper.sh

# Set Path
  # homebrew path setup
  PATH="/usr/local/sbin:$PATH"

  # CUDA
  PATH="/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}"
  DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}"

  # OpenCV
  PATH="/usr/local/Cellar/opencv/2.4.13.1/include/opencv2${PATH:+:${PATH}}"

  # ImageMagick
  PATH="/usr/local/Cellar/imagemagick/6.9.7-0/bin:$PATH"
  DYLD_LIBRARY_PATH="/usr/local/Cellar/imagemagick/6.9.7-0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}"

  # swift env
  export SWIFTENV_ROOT="$HOME/.swiftenv"
  export PATH="$SWIFTENV_ROOT/bin:$PATH"
  eval "$(swiftenv init -)"
