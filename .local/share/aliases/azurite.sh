#!/usr/bin/zsh

alias start-azure-emulator="docker run -p 10000:10000 -d mcr.microsoft.com/azure-storage/azurite azurite-blob --blobHost 0.0.0.0"
