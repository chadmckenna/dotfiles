" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" set guifont=Monaco\ for\ Powerline:h13
set guifont=RobotoMono\ Nerd\ Font\ Mono:h14

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

