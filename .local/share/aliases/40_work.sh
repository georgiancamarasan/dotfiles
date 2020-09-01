startEsicPostgres() {
  docker container exists esic-postgres
  if [ $? -eq 0 ]; then
    docker container start esic-postgres
  else
    docker run --name esic-postgres -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -d --publish 5432:5432 postgres
  fi
}

startSeq() {
  docker container exists esic-seq
  if [ $? -eq 0 ]; then
    docker container start esic-seq
  else
    docker run -d --name esic-seq -it -e ACCEPT_EULA=Y -p 5341:80 datalust/seq
  fi
}

alias start-esic-postgres=startEsicPostgres
alias start-seq=startSeq
alias open-seq="xdg-open http://localhost:5341"
alias start-work="start-esic-postgres && start-seq && start-azure-emulator && sleep 5 && open-seq"
