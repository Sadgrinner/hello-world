" Note: in .vimrc you use double quote for comments
" curl https://github.com/Sadgrinner/hello-world/blob/master/dotfiles/.vimrc -o ~/.vimrc

" TOGGLE AUTO-INDENTING
set pastetoggle=<F2>

" PERSISTENT UNDO
" Note: see http://vi.stackexchange.com/a/53 or http://amix.dk/blog/post/19548 for more variations): 
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone"
set undoreload=10000 "maximum number lines to save for undo on a buffer reload"

" save backup files to a special directory
set backupdir=~/.vim/backupdir
set directory=~/.vim/backupdir

