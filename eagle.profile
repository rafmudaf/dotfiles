
# Get the common bash configuration
  source ~/.common.bash

# Configure for Eagle / CentOS
  export PS1="$BGreen>>eagle@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/usr/bin/nano

  alias open='xdg-open'

  # hpc
  alias anynode='srun --export=ALL -A hfm -t 04:00:00 --job-name=openfast_testing --ntasks=24 --pty bash'
  alias debugnode='srun --export=ALL -A hfm -t 01:00:00 -p debug --job-name=openfast_testing --ntasks=2 --pty bash'
  alias gpu='srun --export=ALL -A hfm -t 04:00:00 -p gpu --job-name=openfast_testing --ntasks=24 --pty bash'
  alias jobs='sacct -u rmudafor'

  # intel tools
  alias vtune='amplxe-gui'
  alias advisor='advixe-gui'

# Set Path and Environment Variables
  # my custom code utilities
  PATH="/home/rmudafor/Development/utils/:$PATH"

  # OPENFAST
  PATH="/home/rmudafor/Development/openfast/build/glue-codes/openfast:/home/rmudafor/Development/openfast/build/modules/beamdyn:$PATH"

  export PATH

  # These flags enable linking to the system libraries when compiling
  LDFLAGS="-L/lib64"
  export LDFLAGS

# Module configuration
  _commonmodules() {
    module load cmake/3.12.3
  }

  gnumodules() {
    # module use /nopt/nrel/ecom/ecp/base/modules/gcc-6.2.0/
    module purge
    _commonmodules
    #module load netlib-lapack/3.8.0
    module load gcc/7.3.0
  }

  intelmodules() {
    module purge
    _commonmodules
    module load comp-intel/2018.0.3
    module load mkl/2018.3.222
  }

  makanimodules() {
    module purge
    _commonmodules
    module load comp-intel/2018.0.3
    module load mkl/2018.3.222
    module load gsl/2.5/intel1803
  }

# conda configuration
  condasetup() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/nopt/nrel/apps/anaconda/5.3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/nopt/nrel/apps/anaconda/5.3/etc/profile.d/conda.sh" ]; then
            . "/nopt/nrel/apps/anaconda/5.3/etc/profile.d/conda.sh"
        else
            export PATH="/nopt/nrel/apps/anaconda/5.3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
  }

  _condamodules() {
    module purge
    module load conda/5.3
  }

  openfast_conda() {
    _condamodules
    source activate openfast
  }

  makani_conda() {
    _condamodules
    source activate makani
  }
