set -e

[ -z $AWS_DEFAULT_REGION ] && AWS_DEFAULT_REGION=
[ -z $AWS_ACCESS_KEY_ID ] && AWS_ACCESS_KEY_ID=
[ -z $AWS_SECRET_ACCESS_KEY ] && AWS_SECRET_ACCESS_KEY=
[ -z $RESTIC_REPOSITORY ] && RESTIC_REPOSITORY=
[ -z $RESTIC_PASSWORD ] && RESTIC_PASSWORD=

if [ -z $AWS_DEFAULT_REGION]; then
    echo "AWS_DEFAULT_REGION not set."
fi

if [ -z $AWS_ACCESS_KEY_ID]; then
    echo "AWS_ACCESS_KEY_ID not set."
fi

if [ -z $AWS_SECRET_ACCESS_KEY]; then
    echo "AWS_SECRET_ACCESS_KEY not set."
fi

if [ -z $RESTIC_REPOSITORY]; then
    echo "RESTIC_REPOSITORY not set."
fi

if [ -z $RESTIC_PASSWORD]; then
    echo "RESTIC_PASSWORD not set."
fi

source ~/archscript/tasks/packages.sh
source ~/archscript/tasks/dotfiles.sh
source ~/archscript/tasks/rust.sh
source ~/archscript/tasks/restic.sh
