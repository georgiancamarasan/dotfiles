function t
  if test (count $argv) -eq 0
    clear
    task
  else
    task $argv
  end
end
