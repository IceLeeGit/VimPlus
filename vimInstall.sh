
set -x

# Install softwares

sudo yum install vim git tmux ctags cscope -y

# Config bundle
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\mkdir -p ~/.vim/autoload
\cp -abrf ./autoload/* ~/.vim/autoload/

# Config tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf 
ln -s -f ~/.tmux/.tmux..conf.local ~/.tmux.conf.local

sed  -i "0,/^alias/s/^alias/alias tmux='tmux -2'\nalias/1" ~/.bashrc
source ~/.bashrc

# Install vimplus
\cp -abrf ./cscope.sh ./start_tmux.sh ./.vimrc ~/                      # tmux cscope .vimrc

if [ $1 == "gitee" ];then
    vim --cmd "let g:gitee = 1" -c "PlugInstall" -c "q" -c "q"

else
    vim -c "PlugInstall" -c "q" -c "q"
fi
