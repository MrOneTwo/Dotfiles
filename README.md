# My dotfiles

- .Xresources - that's for urxvt terminal (place it in _~_)
- rc.lua      - that's for awesome wm (place it in _~/.config/awesome/_)
- init.vim    - that's for nvim (place it in _~/.config/nvim/_)
- .vimrc      - that's for vim (place it in _~_)


## Tools I depend on

- ripgrep/ugrep
- Kakoune
- fzf
- ctags
- i3
- nnn


## Snippets

I haven't implemented those in my workflow but those are very useful.

Insert a branch name on the command line via fzf:

```sh
export FZF_CTRL_T_COMMAND='git branch --format="%(refname:short)"'
git branch -D <CTRL+T>
```
