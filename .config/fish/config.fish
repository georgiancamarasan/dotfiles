set -x PATH $PATH:/home/georgian/.cargo/bin
set -x PATH $PATH:/home/georgian/.local/bin
set -x DISPLAY 192.168.1.121:0
zoxide init fish | source
fish_vi_key_bindings
