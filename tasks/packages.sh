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

if [ -d "/home/abautista/tmp/yay" ]; then
    rm -rf ~/tmp/yay
fi

git clone https://aur.archlinux.org/yay.git ~/tmp/yay
cd ~/tmp/yay
makepkg -si
