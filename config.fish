set -x DOCKER_CERT_PATH /Users/mpilman/.boot2docker/certs/boot2docker-vm
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_TLS_VERIFY 1
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_COLLATE "en_US.UTF-8"
set -x LC_CTYPE "UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_MONETARY "en_US.UTF-8"
set -x LC_NUMERIC "en_US.UTF-8"
set -x LC_TIME "en_US.UTF-8"
set -x TERM xterm-256color
set -x MANPAGER most

set -x PATH $HOME/.local/bin $PATH
if test -d $HOME/.cargo/
    set -x PATH $HOME/.cargo/bin $PATH
end

set RUST_SRC_PATH $HOME/Projects/rust/src

function vman
    vim -c "SuperMan $argv"
    if test $status
        echo "No manual entry for $argv"
    end
end

