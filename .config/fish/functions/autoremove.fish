function autoremove
  set packages_to_remove (pacman -Qdtq)
  set nr_packages (count $packages_to_remove)
  if test "$nr_packages" -eq 0
    echo "Nothing to remove"
  else
    echo $packages_to_remove # | sudo pacman -Rs -
  end
end
