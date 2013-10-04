if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " ROS launch files are XML
  au! BufRead,BufNewFile *.launch setfiletype xml
augroup END
