" Load bundles via pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" General editor options
set modeline
set number

" Tab-completion behaviour
set wildmenu
set wildmode=longest:full

" Always show a status line
set laststatus=2

" Switch on file-specific plugins and indenting
filetype plugin on
filetype indent on

" Enable syntax highlighting and set an appropriate colour-scheme
syntax on
colorscheme zenburn

" I like these colours for the status bar rather than the zenburn ones. They
" are just the default but with fg and bg reversed.
hi StatusLine      guibg=#313633 guifg=#ccdc90
hi StatusLineNC    guibg=#2e3330 guifg=#88b090
hi StatusLine      ctermbg=236   ctermfg=186
hi StatusLineNC    ctermbg=235   ctermfg=108

" Enable man-page reading via the :Man command
runtime ftplugin/man.vim

" Re-generate omni-complete ctags file via CRTL-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" If we're using the DoxygenToolkit plugin, set the comment style to be C++ style.
let g:DoxygenToolkit_commentType="C++"

" With fugitive, auto-delete buffers when we move out of them and show the
" current git branch name in the status line.
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
 
" vim:sw=2:sts=2:et
