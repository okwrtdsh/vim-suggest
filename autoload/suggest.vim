let g:suggest_lang = 'ja'
function! suggest#GoogleComplete(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    if a:base == ''
      return
    else
      let ret = system('curl -s -G --data-urlencode "q='
            \ . a:base . '" "http://suggestqueries.google.com/complete/search?&client=firefox&hl=' . g:suggest_lang . '&ie=utf8&oe=utf8"')
      let res = split(substitute(ret,'\[\|\]\|"',"","g"),",")
      return res
    endif
  endif
endfunction

