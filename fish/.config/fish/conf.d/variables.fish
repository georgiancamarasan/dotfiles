if test -d /home/$USER/.local/bin
  set PATH $PATH:/home/$USER/.local/bin
end

if test -d /home/$USER/.local/nvim/bin
  set PATH $PATH:/home/$USER/.local/nvim/bin
end

if test -d /home/$USER/.cargo/bin
  set PATH $PATH:/home/$USER/.cargo/bin
end

if test -d /home/$USER/code/lua-language-server/bin/
  set PATH $PATH:/home/$USER/code/lua-language-server/bin/
end

if test -d /home/$USER/.dotnet/tools
  set PATH $PATH:/home/$USER/.dotnet/tools
end

set EDITOR nvim
