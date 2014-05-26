if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let g:sr_ids = []

function! FuzzyCompleteIds(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '[a-zA-Z_-]'
      let start -= 1
    endwhile
    let i=0
    while l:i < line('$')
        let data = getline(l:i)
        let m = matchlist(data, '\v^dialog [0-9]+\(([^\)]+)\)') 
        if len(m) > 0
            "echom 'Adding '.m[1]
            call add(g:sr_ids, m[1])
        endif
        let m = matchlist(data, '\v^text [0-9]+\(([^\)]+)\)') 
        if len(m) > 0
            "echom 'Adding '.m[1]
            call add(g:sr_ids, m[1])
        endif
        let l:i += 1
    endwhile
    return start
  else
    let res = []
    let regex = ''
    let i = 0
    while l:i < len(a:base)
        let l:regex .= a:base[i].'.*'
        let l:i+=1
    endwhile
    "echom 'REgex:'.l:regex
    for m in g:sr_ids
      if m =~ l:regex
        call add(res, m)
      endif
    endfor
    return res
  endif
endfunction

set completefunc=FuzzyCompleteIds
set omnifunc=FuzzyCompleteIds

"echom "Loaded sr plugin"
