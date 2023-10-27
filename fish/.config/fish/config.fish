if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
end
if test -e ~/.config/fish/functions/l.fish
  source ~/.config/fish/functions/l.fish
end
if test -e ~/.config/fish/functions/ll.fish
  source ~/.config/fish/functions/ll.fish
end
