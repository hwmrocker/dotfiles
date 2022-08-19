if id olaf &>/dev/null; then
    echo 'user olaf found'
else
    echo 'user olaf not found, creating it'
    useradd -m olaf
    usermod -aG wheel olaf
    passwd olaf
fi

function setup_sudo(){
    echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/enable_wheel
    chmod 0440 /etc/sudoers.d/enable_wheel
}

function setup_yay() {
    sudo -u olaf bash <<EOF
    echo "setup yay"
    echo "install dependencies"
    pacman -S --needed git base-devel
    mkdir -p /home/olaf/myspace
    pushd /home/olaf/myspace
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    popd
EOF
}

setup_sudo
setup_yay