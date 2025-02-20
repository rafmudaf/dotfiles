
# Get the common bash configuration
  source ~/.common.bash

# Configure for Kestrel / CentOS
  # export PS1="$BGreen>>kestrel $BPurple\u$White@$BPurple\h $BCyan\w $Yellow GPU $BRed\$ $Color_Off"
  export PS1="$BGreen>>kestrel $BPurple\u$White@$BPurple\h $BCyan\w $BYellow\$(__git_ps1 '(%s)') $BRed\$ $Color_Off"
  
  export EDITOR=/usr/bin/nano

  alias open="xdg-open"

  # hpc
  allocation="ssc"
  job_name="floris_testing"
  alias anynode="srun --export=ALL -A $allocation -t 04:00:00 --job-name=$job_name --ntasks=24 --pty bash"
  alias debugnode="srun --export=ALL -A $allocation -t 01:00:00 -p debug --job-name=$job_name --ntasks=1 --pty bash"
  alias gpu="srun --export=ALL -A $allocation -t 04:00:00 -p gpu-h100s --job-name=$job_name --ntasks=1 --gpus=1 --pty bash"
  alias jobs="sacct -u rmudafor"

  # intel tools
  alias vtune="amplxe-gui"
  alias advisor="advixe-gui"

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
    module load cmake
  }

  gnumodules() {
    module purge
    _commonmodules
    module load gcc/7.3.0
  }

  intelmodules() {
    module purge
    _commonmodules
    module load comp-intel/2018.0.3
    module load mkl/2018.3.222
  }

  defaultmodules() {
    # module purge    # Unless we're switching toolchains, keep the default modules
    module load mamba
    module load PrgEnv-nvidia
    module load cuda/12.3
    # perftools-lite
  }
  defaultmodules

  nsys_prof() {
    nsys profile --stats=true python $1
  }
