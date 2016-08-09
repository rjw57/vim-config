" Single place to put custom autocmds

" Disable spell checking for some file types
autocmd FileType asm,man set nospell

" CA65 sources
augroup filetypedetect
	au BufNewFile,BufRead *.s,*.inc set ft=asm_ca65
augroup END
