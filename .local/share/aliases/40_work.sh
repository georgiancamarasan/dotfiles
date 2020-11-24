function startEsicPostgres
  docker container exists esic-postgres
  if test $status = 0
    docker container start esic-postgres
  else
    docker run --name esic-postgres -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -d --publish 5432:5432 postgres
  end
end

function startSeq
  docker container exists esic-seq
  if test $status = 0
    docker container start esic-seq
  else
    docker run -d --name esic-seq -it -e ACCEPT_EULA=Y -p 5341:80 datalust/seq
  end
end

alias start-esic-postgres=startEsicPostgres
alias start-seq=startSeq
alias open-seq="xdg-open http://localhost:5341"
alias start-work="start-esic-postgres && start-seq && start-azure-emulator && sleep 5 && open-seq"
