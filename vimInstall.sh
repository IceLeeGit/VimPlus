

set -x

# Install softwares

sudo yum install vim git tmux -y

# Config bundle
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\cp -arf ./autoload/plug.vim ~/.vim/autoload/
\cp -arf ./autoload/pathogen.vim ~/.vim/autoload/

# Config tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s  ~/.tmux/.tmux.conf ~/.tmux.conf 
sed  -i "0,/^alias/s/^alias/alias tmux='tmux -2'\nalias/1" ~/.bashrc
source ~/.bashrc

# Install vimplus
\cp -arf ./cscope.sh ./start_tmux.sh ./.vimrc ~/                      # tmux cscope .vimrc
vim -c "PlugInstall" -c "q" -c "q"
