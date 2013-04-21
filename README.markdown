Taken from  https://github.com/sontek/dotfiles.git

# Basic Setup
## Install important stuff

    apt-get install openssh-server github

## Then check this stuff out
    
    git clone https://github.com/timconradinc/dotfiles.git

## Install packages and set up repos

    ./package-setup.sh

## Next, install stuff

    ./install.sh

## Files
.vim
    directory of file type configurations and plugins
.vimrc
    my vim configuration
.screenrc
    my screen configuration
.weechat
    my configuration for weechat, a great irc client
.gimp
    my tweaks/additions to gimp (fonts, brushes, etc)

# Instructions
## Creating source files
Any file which matches the shell glob `_*` will be linked into `$HOME` as a symlink with the first `_`  replaced with a `.`

For example:

    _bashrc

becomes

    ${HOME}/.bashrc
