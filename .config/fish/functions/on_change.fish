function on_change
  while true
    ls -d **/*.* | entr -dc $argv
  end
end
