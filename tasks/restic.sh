cat << EOF > ~/.config/restic-backup.conf
AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
RESTIC_REPOSITORY=$RESTIC_REPOSITORY
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
RESTIC_PASSWORD=$RESTIC_PASSWORD
EOF

cat << EOF > ~/.config/systemd/user/restic-backup.service
[Unit]

[Service]
Type=oneshot
ExecStart=restic backup %h/assets %h/code %h/self %h/inbox --exclude="node_modules" --exclude="target" --exclude=".venv" --exclude="build" --verbose=2
EnvironmentFile=%h/.config/restic-backup.conf
EOF

cat << EOF > ~/.config/systemd/user/restic-backup.timer
[Unit]
Description=Backup with restic

[Timer]
OnCalendar=hourly

[Install]
WantedBy=timers.target
EOF

cat << EOF > ~/.config/systemd/user/restic-prune.service
[Unit]
Description=Prune data from restic repository weekly

[Service]
Type=oneshot
ExecStart=restic forget --prune --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --keep-yearly 2
EnvironmentFile=%h/.config/restic-backup.conf
EOF

cat << EOF > ~/.config/systemd/user/restic-prune.timer
[Unit]
Description=Restic backup service (data pruning)

[Timer]
OnCalendar=*-*-* 19:15:00

[Install]
WantedBy=timers.target
EOF