# vimrc

After copying this file to /etc/vim folder, perform the following steps:

1. Install plugin manager to install plugins 
 $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
2. Install YCM - You complete me  - code completion plugin 
 $ sudo apt install build-essential cmake python3-dev
 $ git clone https://github.com/ycm-core/YouCompleteMe.git
 Put the cloned directory in ~/.vim/bundle
 cd ~/.vim/bundle/YouCompleteMe
 git submodule update --init --recursive
 python3 install.py --clang-completer

2. Go to vim and execute the command :PlugInstall to install all the plugins 
