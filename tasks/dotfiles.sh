#eval $(ssh-agent)
#ssh-add ~/.ssh/id_ed25519

if [ -d "/home/abautista/.dotfiles" ]; then
    rm -rf ~/.dotfiles
fi

git clone git@github.com:albertoide/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make all

cat << EOF > ~/.env
export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
export RESTIC_REPOSITORY=$RESTIC_REPOSITORY
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export RESTIC_PASSWORD=$RESTIC_PASSWORD
EOF

