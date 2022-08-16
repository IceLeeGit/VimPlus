#!/usr/bin/sh

set -e

# Get Install CMD
if [ -x "/usr/bin/yum" ];then
    YumCmd="/usr/bin/yum"
elif [ -x "/usr/bin/apt" ]; then
    YumCmd="/usr/bin/apt"
else
    echo "Not found the OS type(Centos/Ubuntu)."
    exit 1
fi

# Install softwares
if [ -f "/usr/bin/sudo" ];then
    sudo ${YumCmd} install vim git tmux ctags cscope -y
else
    ${YumCmd} install vim git tmux ctags cscope -y
fi

# Config bundle
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\mkdir -p ~/.vim/autoload
\cp -abrf ./autoload/* ~/.vim/autoload/

# Config tmux
#git clone https://github.com/gpakosz/.tmux.git ~/.tmux
#ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
#ln -s -f ~/.tmux/.tmux.conf.local ~/.tmux.conf.local


#enable nvim config
\mkdir -p ~/.config/nvim
ln -s -f ~/.vim ~/.config/nvim
ln -s -f ~/.vimrc ~/.config/nvim/init.vim

# Config Coc config
\cp -abf ./coc-settings.json ~/.vim/coc-settings.json



sed  -i "0,/^alias/s/^alias/alias tmux='tmux -2'\nalias/1" ~/.bashrc
source ~/.bashrc

# Install vimplus
\cp -abrf ./start_tmux.sh ./.vimrc ~/                      # tmux cscope .vimrc


# Install nodejs
curl -sL install-node.vercel.app/lts | bash

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
\cp -abrf ./create_cstags ~/.vim/plugged
