" http://nanasi.jp/articles/code/stdplugin/save-cpo.html {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

if exists("loaded_gentle_quitmen")
  finish
endif
let loaded_gentle_quitmen = 1


if !exists(':GQ')
  " -bang allow !
  command -bang GQ :call <SID>gentle_quitman("<bang>")
endif

function! <SID>gentle_quitman(bang)
  let window_counter = 0
  windo let window_counter = window_counter + 1

  if window_counter == 1
    let a = input("Really quit last window? [n/Y] ")
    if a == "Y"
      exec "q" . a:bang
    endif
  else
    q
  endif
endfunction

" http://nanasi.jp/articles/code/stdplugin/save-cpo.html {{{
let &cpo = s:save_cpo
" }}}
