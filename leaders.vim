" Special commands using the leader key
" Git shortcuts
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gc :Gcommit<CR>

" Mappings for vim-go
au FileType go nmap <leader>i :GoImports<CR>
au FileType go nmap <leader>n :GoInstall ./...<CR>
au FileType go nmap <leader>N :GoInstall<CR>

