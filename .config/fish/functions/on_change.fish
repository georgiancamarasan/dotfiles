function on_change
  while true
    ls -d **/*.* | entr -d $argv
  end
end
