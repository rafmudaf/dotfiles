
##########
# Configures the bash and git environments

home=$HOME
dotfiles=$home/Development/dotfiles

# set the system as one of [eagle nrel raf ubuntu]
system=nrel
# brewdir=/usr/local      # homebrew install directory for intel mac
brewdir=/opt/homebrew   # homebrew install directory for arm mac
##########

# Helper function to create a link
force_create_link() {
    source=$1
    destination=$2
    if [ -L $destination ]; then
        rm $destination
    fi
    ln -s $source $destination    
}

# Configure the bash environment
configfiles=(colors.bash common.bash)
for f in ${configfiles[@]}; do
    force_create_link $dotfiles/$f $home/.$f
done
force_create_link $dotfiles/$system.profile $home/.$system.profile

# Configure the git environment
configfiles=(gitconfig)
for f in ${configfiles[@]}; do
    cp $dotfiles/$f $home/.$f
done
if [[ $system == "eagle" ]]; then
    echo "TODO: configure for install on eagle"
elif [[ $system == "nrel" ]]; then
    force_create_link $brewdir/etc/bash_completion.d/git-completion.bash $home/.git-completion.bash
    force_create_link $brewdir/etc/bash_completion.d/git-prompt.sh $home/.git-prompt.sh
elif [[ $system == "raf" ]]; then
    force_create_link /usr/local/etc/bash_completion.d/git-completion.bash $home/.git-completion.bash
    force_create_link /usr/local/etc/bash_completion.d/git-prompt.sh $home/.git-prompt.sh
elif [[ $system == "ubuntu" ]]; then
    force_create_link /etc/bash_completion.d/git-prompt $home/.git-prompt.sh
fi

# Source the bash profile
source $home/.$system.profile
