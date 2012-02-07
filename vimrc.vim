" General editor options
set modeline
set number

" Tab-completion behaviour
set wildmenu
set wildmode=longest:full

" Switch on file-specific plugins and indenting
filetype plugin on
filetype indent on

" Load bundles via pathogen
call pathogen#infect()

" Enable syntax highlighting and set an appropriate colour-scheme
syntax on
colorscheme zenburn

" Enable man-page reading via the :Man command
runtime ftplugin/man.vim

" Re-generate omni-complete ctags file via CRTL-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" If we're using the DoxygenToolkit plugin, set the comment style to be C++ style.
let g:DoxygenToolkit_commentType="C++"

" With fugitive, auto-delete buffers when we move out of them
autocmd BufReadPost fugitive://* set bufhidden=delete
 
" vim:sw=2:sts=2:et
