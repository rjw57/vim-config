" Vim doesn't like fish
set shell=bash

" This setting needs to be set *before( syntastic is loaded by Vundle
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'passive_filetypes': [] }

" While we are configuring syntastic, add the recommended settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python-specific syntastic options
let g:syntastic_python_checkers = ['flake8']

" Vundle config
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" FIXME: remove hard-coded path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
"Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/opencl.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-vinegar'
Plugin 'Lokaltog/vim-powerline'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'killphi/vim-ebnf'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-abolish'
Plugin 'altercation/vim-colors-solarized'
Plugin 'maxbane/vim-asm_ca65'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'rust-lang/rust.vim'
"Plugin 'python-mode/python-mode'
Plugin 'aklt/plantuml-syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'letorbi/vim-colors-modern-borland'
Plugin 'lifepillar/vim-solarized8'

call vundle#end()            " required

" General editor options
set modeline
set number

" Tab-completion behaviour
set wildmenu
set wildmode=list:full

" Enable spell checking
set spell
set spelllang=en_gb

" Always show a status line
set laststatus=2

" Switch on file-specific plugins and indenting
filetype plugin on
filetype indent on

" Enable syntax highlighting and set an appropriate colour-scheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" colorscheme solarized8
"colorscheme borland
syntax on

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

" Enable enhanced syntax highlighting for doxygen.
let g:load_doxygen_syntax=1

" For C++ files, add Doxygen-style comments to the accepted styles
autocmd Filetype c,cpp set comments^=:///

" I never write common LISP but quite often write OpenCL kernels :)
autocmd BufRead,BufNewFile *.cl set filetype=opencl
autocmd BufRead,BufNewFile *.cl set cindent

" Typescript + JSX
autocmd BufRead,BufNewFile *.tsx set filetype=typescript

" With fugitive, auto-delete buffers when we move out of them and show the
" current git branch name in the status line.
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Set the default encoding to be UTF-8
set encoding=utf-8

" Enable local .vimrcs
set exrc

" let g:clang_use_library=1
" let g:clang_library_path="/usr/lib/llvm-3.2/lib/"

" Use F12 to toggle filesystem tree on and off
nmap <F12> :NERDTreeToggle<CR>

" HACK to make .md mean markdown and not modula2
autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown

" When using the vim-markdown plugin, this maps code-block language names
" to the syntax highlighter to use. Add things here as one uses them.
let g:markdown_fenced_languages = ["javascript", "python", "css", "html", "console=sh"]

" Set characters to show for trailing whitespace/tabs
set listchars=tab:›\ ,trail:·
set list

" Let CtrlP understand git

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
\ }

" Some files we definitely do not want to complete when matching files or
" directories
set wildignore+=*.egg,*.egg-info,*.pyc " Python-related files

" Specify that we store swap files inside ~/.vim.
" TODO: make this portable to non-Unix systems
set directory=$HOME/.vim/tmp//

" Support using jsxhit rather than jshint with syntasic
autocmd BufRead,BufNewFile *.jsx let g:syntastic_javascript_checkers = ['jsxhint']

" Load leader key commands
source $HOME/.vim/leaders.vim

" Highlight column 1 after textwidth
set textwidth=80
set colorcolumn=+1

" Make colorcolumn look nicer
hi ColorColumn guibg=#262626 ctermbg=235

" Don't start with any folds
set foldlevelstart=99

" Specific autocmds
source $HOME/.vim/autocmds.vim

" Magic file watchers like webpack sometimes fail to notice edits unless this is
" set.
set backupcopy=yes

" Tell vim that Jenkinsfiles use Groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

" Pymode configuration
let g:pymode_lint_on_write = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode = 0

" RAML files are YAML
au BufWinEnter,BufNewFile,BufRead *.raml setf yaml

" vim:sw=2:sts=2:et
