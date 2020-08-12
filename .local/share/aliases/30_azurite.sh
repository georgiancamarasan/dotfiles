#!/usr/bin/zsh

startAzureEmulator() {
  docker container exists azure-emulator
  if [ $? -eq 0 ]; then
    docker container start azure-emulator
  else
    docker run --name azure-emulator -p 10000:10000 -d mcr.microsoft.com/azure-storage/azurite azurite-blob --blobHost 0.0.0.0
  fi
}

alias start-azure-emulator=startAzureEmulator
