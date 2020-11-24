#!/usr/bin/zsh

function startAzureEmulator
  docker container exists azure-emulator
  if test $status = 0
    docker container start azure-emulator
  else
    docker run --name azure-emulator -p 10000:10000 -d mcr.microsoft.com/azure-storage/azurite azurite-blob --blobHost 0.0.0.0
  end
end

alias start-azure-emulator=startAzureEmulator
