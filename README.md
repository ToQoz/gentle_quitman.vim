# gentle_quitman.vim

This plugin provides :GQ and :GWQ command. it confirm before quit last window.

## Tips. If you want to override default q/quit

### STEP1

Install http://github.com/tyru/vim-altercmd

### STEP2

Add followings to your vimrc.

```
call altercmd#load()
AlterCommand q GQ
AlterCommand GQ q

AlterCommand quit GQ
AlterCommand GQ quit

AlterCommand wq GWQ
AlterCommand GWQ wq
```
