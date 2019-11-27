
home_directory=/home/raf
target_profile=ubuntu.profile
dotfiles=$home_directory/Development/dotfiles

force_create_link() {
    source=$1
    destination=$2
    if [ -L $destination ]; then
        rm $destination
    fi
    ln -s $source $destination    
}

cd $home_directory
force_create_link $dotfiles/$target_profile .$target_profile
force_create_link $dotfiles/colors.bash .colors.bash
force_create_link $dotfiles/gitconfig .gitconfig
force_create_link /etc/bash_completion.d/git-prompt .git-prompt.sh
