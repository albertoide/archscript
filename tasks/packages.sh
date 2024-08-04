sudo pacman -Syu

sudo pacman -S --noconfirm \
    git \
    breeze-gtk \
    breeze-icons \
    lazygit \
    greetd \
    greetd-tuigreet \
    kitty \
    qtile \
    direnv \
    tree \
    starship \
    ttf-cascadia-code-nerd \
    noto-fonts-emoji \
    fzf \
    jq \
    ripgrep \
    neovim \
    restic \
    redshift \
    lsd \
    zathura zathura-pdf-poppler \
    rofi \
    pcmanfm \
    gvfs \
    gvfs-mtp \
    udiskie

if [ -d "/home/abautista/tmp/yay-bin" ]; then
    rm -rf ~/tmp/yay-bin
fi

git clone https://aur.archlinux.org/yay-bin.git ~/tmp/yay-bin
cd ~/tmp/yay-bin
makepkg -si --noconfirm

