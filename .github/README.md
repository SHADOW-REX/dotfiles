# dotfiles

My dotfiles

## Intro

This repo is for storing my public config files, canonically called "dotfiles". Having dotfiles in a repo makes setup on a new machine just a simple `git clone` away. Some of the techniques and code are based on concepts from [this article on bare repos](https://www.atlassian.com/git/tutorials/dotfiles) and the zillions of other [dotfile repos on GitHub][github-dotfiles].

![Terminal][terminal_gif]

### Prerequisites

- git

## Bare repo

```zsh
alias dotty='GIT_WORK_TREE=~ GIT_DIR=~/.dotfiles'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
git clone --bare git@github.com:SHADOW-REX/dotfiles $HOME/.dotfiles
dotfiles checkout
if [[ $? == 0 ]]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up pre-existing dot files.";
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles.bak/{}
fi
```

## Edit

```zsh
IDE=${VISUAL:-${EDITOR:-nvim}}
dotty $IDE ~
```

## Notes

Certain legacy apps don't properly use .config, so anything that doesn't has a simple wrapper in `$HOME` that then sources the real files from `~/.config`.

## Resources

- [Managing dotfiles with a bare git repo](https://www.atlassian.com/git/tutorials/dotfiles)
- [Managing dotfiles with GNU Stow](https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html)
- [Using GNU Stow to Manage Symbolic Links for Your Dotfiles](https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/)
-[github-dotfiles]:           https://dotfiles.github.io
[rsync]:                     http://man7.org/linux/man-pages/man1/rsync.1.html
[stow]:                      https://www.gnu.org/software/stow/
