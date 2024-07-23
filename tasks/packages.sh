sudo pacman -Syu

sudo pacman -S --noconfirm \
    git \
    qtile \
    direnv \
    tree \
    starship \
    fzf \
    jq \
    ripgrep \
    neovim \
    restic \
    redshift \
    lsd \
    zathura zathura-pdf-poppler \
    rofi \
    pcmanfm

if [ -d "/home/abautista/tmp/yay-bin" ]; then
    rm -rf ~/tmp/yay-bin
fi

git clone https://aur.archlinux.org/yay-bin.git ~/tmp/yay-bin
cd ~/tmp/yay-bin
makepkg -si --noconfirm

