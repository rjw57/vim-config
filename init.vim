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

" JS-specific syntasic options
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_typescript_checkers=['eslint']
let g:syntastic_typescript_eslint_exe='$(npm bin)/eslint'

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
"Plugin 'scrooloose/syntastic'
Plugin 'dense-analysis/ale'
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
"Plugin 'altercation/vim-colors-solarized'
Plugin 'maxbane/vim-asm_ca65'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'rust-lang/rust.vim'
"Plugin 'python-mode/python-mode'
Plugin 'aklt/plantuml-syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'letorbi/vim-colors-modern-borland'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'chriskempson/base16-vim'
Plugin 'caglartoklu/borlandp.vim'
Plugin 'ericbn/vim-solarized'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'neovim/nvim-lspconfig'
Plugin 'lewis6991/spellsitter.nvim'

call vundle#end()            " required

" General editor options
set modeline
set number
set nohlsearch
set noincsearch

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
if exists('+termguicolors')
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
"let g:borlandp_bg = "dark_blue"
colorscheme solarized
" colorscheme solarized8
" colorscheme borland
" colorscheme borlandp
" colorscheme base16-default-dark
syntax on

hi clear SpellBad
hi SpellBad cterm=underline

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

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "python", "javascript", "typescript", "tsx", "vim",
    "dockerfile", "bash", "json", "dot", "go", "cpp", "lua",
    "html", "css", "gomod", "regex", "yaml"
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
EOF

" Spellsitter (spellchecking for treesitter)
lua require('spellsitter').setup()

" Language server
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" vim:sw=2:sts=2:et
