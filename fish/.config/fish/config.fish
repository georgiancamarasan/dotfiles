if status is-interactive
    # Commands to run in interactive sessions can go here
    set PATH $PATH:/home/$USER/.cargo/bin
    fish_vi_key_bindings
end
