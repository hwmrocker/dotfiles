My dotfile
==========

to install the dotfiles, install stow first:

    sudo apt-get install stow

or

    sudo pacman -S stow

and then run:

    stow -t $HOME git
    stow -t $HOME fish
    stow -t $HOME bash
    stow -t $HOME vim
    stow -t $HOME subl

