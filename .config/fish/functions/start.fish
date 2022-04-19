function start
  snap run $argv &
  disown (jobs -p | tail)
  sleep 2
  echo ''
end
