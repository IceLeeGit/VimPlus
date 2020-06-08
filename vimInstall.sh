#!/usr/bin/sh

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

cmd_args=""
if [ "$1" == "gitee" ];then
    cmd_args='let g:gitee = 1'
fi

if [ "$2" == "ycm" ];then
    ./install_gitee.sh
    if [ -z "${cmd_args}" ];then
        cmd_args="let g:ycm = 1"
    else
        cmd_args="${cmd_args} | let g:ycm = 1"
    fi
fi

vim --cmd "${cmd_args}" -c "PlugInstall" -c "q" -c "q"
