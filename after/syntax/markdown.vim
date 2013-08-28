" Highlight maths regions in Markdown correctly
syntax include @tex syntax/tex.vim
syn region displayMath matchgroup=markdownMath start="\$" end="\$" contains=@tex keepend
syn region inlineMath matchgroup=markdownMath start="^\s*\$\$.*$" end="^\s*\$\$\ze\s*$" contains=@tex keepend
hi def link markdownMath SpecialComment
