

set -x

# Install softwares

yum install vim git tmux -y

# Config bundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Config tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s  ~/.tmux/.tmux.conf ~/.tmux.conf 
sed  -i "0,/^alias/s/^alias/alias tmux='tmux -2'\nalias/1" ~/.bashrc
source ~/.bashrc

# Install vimplus
cp -arf ./cscope.sh ./start_tmux.sh ./.vimrc /root/                      # tmux cscope .vimrc
vim -c "PluginInstall" -c "q" -c "q"
