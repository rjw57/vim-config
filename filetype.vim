if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " ROS launch files are XML
  au! BufRead,BufNewFile *.launch setfiletype xml

  " Set default Python indent style
  au! Filetype python set sw=4 sts=4 et
augroup END
