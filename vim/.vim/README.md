# vimconfig

![VIM configuration screenshot](screenshot_1.png)

## Installation

Clone with:

    git clone git@github.com:moshen/vimconfig.git .vim

or

    git clone https://github.com/moshen/vimconfig.git .vim

Run `setup.sh`!

`setup.sh` usage:

    ./setup.sh [-r|-u|-h] [branch]

    -r      Remote setup, grabs your Vim config from GitHub
    -u      Update Vim config from GitHub and update all Plugins
    -h      Print this help
    branch  The branch name to checkout after setup.
            Defaults to 'master'. Only works with -r or no options

## Dependencies

For using ag.vim you need to have installed the silver searcher app. If you don't, please execute this command:

    sudo apt-get install silversearcher-ag

## Credits

My Vim config codebase was created by [Mosen](https://github.com/moshen/vimconfig)
