startEsicPostgres() {
  docker container exists esic-postgres
  if [ $? -eq 0 ]; then
    docker container start esic-postgres
  else
    docker run --name esic-postgres -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -d --publish 5432:5432 postgres
  fi
}

alias start-esic-postgres=startEsicPostgres
