" http://nanasi.jp/articles/code/stdplugin/save-cpo.html {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

if exists("loaded_gentle_quitmen")
  finish
endif
let loaded_gentle_quitmen = 1


if !exists(':GQ')
  command GQ :call <SID>gentle_quitman()
endif

function! <SID>gentle_quitman()
  let window_counter = 0
  windo let window_counter = window_counter + 1

  if window_counter == 1
    let a = input("Really quit last window? [n/Y] ")
    if a == "y"
      q
    endif
  else
    q
  endif
endfunction

" http://nanasi.jp/articles/code/stdplugin/save-cpo.html {{{
let &cpo = s:save_cpo
" }}}
