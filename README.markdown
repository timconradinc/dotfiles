Taken from  https://github.com/sontek/dotfiles.git

# Basic Setup
## Install important stuff

    sudo apt-get install openssh-server git

## Then check this stuff out
    
    git clone https://github.com/timconradinc/dotfiles.git

## Install packages and set up repos

    ./package-setup.sh

### Notes on Setup

This is mostly being set up around using rvm/virtualenv for
development work and not relying very much on system packages.

So tools like ipython aren't installed, since I put them in
my virtualenv when I work on stuff.

## Then set up $HOME

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
