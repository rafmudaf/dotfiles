
# Get the common bash configuration
  source ~/.common.bash

# Configure for Eagle / CentOS
  export PS1="$BGreen>>eagle@$BBlue\w $BPurple\$(__git_ps1 '(%s)')$BRed\$ $Color_Off"
  export EDITOR=/usr/bin/nano

  alias open='xdg-open'

  # hpc
  alias anynode='srun --export=ALL -A hfm -t 04:00:00 --job-name=openfast_testing --ntasks=24 --pty bash'
  alias gpu='srun --export=ALL -A hfm -t 04:00:00 -p=gpu --job-name=openfast_testing --ntasks=24 --pty bash'
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

# Module configuration
  _commonmodules() {
    module load cmake/3.12.3
    module load conda/5.3
    source activate openfast
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

  # load the intel modules by default
  ## commented due to a bug in the fastx environment
  # intelmodules
