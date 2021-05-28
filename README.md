# dotfiles
My dotfiles.

## Install
~~~bash
git clone --bare https://git.camarasan.com/georgian/dotfiles $HOME/.cfg
function dotfiles
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
# mkdir -p .dotfiles-backup
# dotfiles checkout
# if [ $? = 0 ]; then
#   echo "Checked out dotfiles.";
#   else
#     echo "Backing up pre-existing dot files.";
#     dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
# fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
~~~
