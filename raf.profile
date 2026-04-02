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

  # Source bash completions
  # These packages are installed with homebrew
  brewdir=/opt/homebrew
  # The git completions sourced above and in common.sh are handled
  # differently so that they work on all systems with these dotfiles.
  # This block of tools are not installed on all systems.
  source $brewdir/etc/bash_completion.d/brew
  source $brewdir/etc/bash_completion.d/cmake
  # source $brewdir/etc/bash_completion.d/ctest
  # source $brewdir/etc/bash_completion.d/gh

  # mac-specific aliases and functions
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias pdf='open -a Preview' 
  tcp () { echo -n $1 | pbcopy; }

# Set Path and Environment Variables

# >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/Users/raf/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
      if [ -f "/Users/raf/miniforge3/etc/profile.d/conda.sh" ]; then
          . "/Users/raf/miniforge3/etc/profile.d/conda.sh"
        else
          export PATH="/Users/raf/miniforge3/bin:$PATH"
        fi
    fi
    unset __conda_setup
  # <<< conda initialize <<<

  # >>> mamba initialize >>>
  # !! Contents within this block are managed by 'mamba shell init' !!
  export MAMBA_EXE='/Users/raf/miniforge3/bin/mamba';
  export MAMBA_ROOT_PREFIX='/Users/raf/miniforge3';
  __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__mamba_setup"
  else
      alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
  fi
  unset __mamba_setup
  # <<< mamba initialize <<<

  # my custom utilities
  PATH="/Users/raf/Development/utilities:$PATH"

  # Homebrew path setup
  # Brew's make and sed are higher version than mac's
  PATH="$brewdir/sbin:$PATH"
  # PATH="$brewdir/opt/make/libexec/gnubin:$PATH"
  # PATH="$brewdir/opt/gnu-sed/libexec/gnubin:$PATH"

  # Add gcloud bash completion
  source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.bash.inc"

  # # swift env
  # export SWIFTENV_ROOT="$HOME/.swiftenv"
  # export PATH="$SWIFTENV_ROOT/bin:$PATH"
  # eval "$(swiftenv init -)"

  export PATH

  # Silences the macOS warning to update to ZSH
  export BASH_SILENCE_DEPRECATION_WARNING=1
