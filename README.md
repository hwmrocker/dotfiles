My dotfile
==========

to install the dotfiles, install stow first:

    sudo apt-get install stow

or

    sudo pacman -S stow

and then run:

    mkdir -p $HOME/bin
    stow -t $HOME locale
    stow -t $HOME arch
    stow -t $HOME git
    stow -t $HOME fish
    stow -t $HOME bash
    stow -t $HOME vim
    stow -t $HOME i3
    stow -t $HOME general-bin
    stow -t $HOME terminator
    stow -t $HOME starship
    stow -t $HOME direnv
