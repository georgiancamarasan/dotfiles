if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -d /home/$USER/.cargo/bin
      set PATH $PATH:/home/$USER/.cargo/bin
    end
    if test -d /home/$USER/code/lua-language-server/bin/
      set PATH $PATH:/home/$USER/code/lua-language-server/bin/
    end
    fish_vi_key_bindings
end
if test -e ~/.config/fish/functions/l.fish
  source ~/.config/fish/functions/l.fish
end
if test -e ~/.config/fish/functions/ll.fish
  source ~/.config/fish/functions/ll.fish
end
