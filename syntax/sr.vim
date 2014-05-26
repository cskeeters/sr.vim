
if exists("b:current_syntax")
  finish
endif

syn keyword srKeyword  dialog text rect pos dim

syn region srString  start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region srString  start=+'+  skip=+\\\\\|\\'+  end=+'+
syn match srNumber   "-\=\<\d*\.\=[0-9_]\>"

hi link srKeyword    Special
hi link srString     String
hi link srNumber     Number
