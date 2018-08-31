## git info in command prompt
# get current branch in git repo
function parse_git_branch() {
BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
if [ ! "${BRANCH}" == "" ]; then
  STAT=`parse_git_dirty`
  echo "[${BRANCH}${STAT}]"
else
  echo ""
fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

# Configure the shell environment
  # export PS1='\[\033[1;32m\]ubuntu@\[\033[1;34m\]\w\[\033[1;31m\]\`parse_git_branch\`\$\[\033[0m\] '
  export PS1='\[\033[1;32m\]ubuntu@\[\033[1;34m\]\w\[\033[1;31m\]\$\[\033[0m\] '
  export EDITOR=/bin/nano

# Aliases and Functions
  alias open='xdg-open'
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

  # openfast
  countOF(){ grep -rn "OpenFAST terminated normally." . | wc -l; }

  # mbdyn
  confmbd() { ./configure --enable-runtime-loading --with-module="kitefastmbd"; }
  cleanmbd() { rm *.out *.ine *.jnt *.log *.mov *.act *.frc *.sum *.bylog; }
  alias mbdpre='python3 ~/Development/makani/KiteFAST/MBDYN/preprocessor/preprocess.py'
  alias pushgerrit='git push origin HEAD:refs/for/master'

# Environment Variables
  # default fortran compiler
  export FC=/usr/bin/gfortran-7

  # Configure Python Virtual Environment
  #export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  #export WORKON_HOME=$HOME/.virtualenvs   # optional
  #export PROJECT_HOME=$HOME/projects      # optional
  #source /usr/local/bin/virtualenvwrapper.sh

# Set Path
  # my custom code utilities
  PATH="/home/raf/Development/utils/:$PATH"

  # OPENFAST
  PATH="/home/raf/Development/openfast/build/glue-codes/fast:/home/raf/Development/openfast/build/modules-local/beamdyn:$PATH"

  # mbdyn
  PATH="/usr/local/mbdyn/bin:$PATH"

  export PATH
