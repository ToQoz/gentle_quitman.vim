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

if !exists(':GWQ')
  command -bang -nargs=* GWQ :w <args> | :call <SID>gentle_quitman("<bang>")
endif

function! <SID>gentle_quitman(bang)
  let a = <SID>is_permitted_quit()
  if a == 1
    exec "q" . a:bang
  endif
endfunction

function! <SID>is_permitted_quit()
  let window_counter = 0
  windo let window_counter = window_counter + 1

  if window_counter == 1
    let a = input("Really quit last window? [n/Y] ")
    if a == "Y"
      return 1
    endif
  else
    return 1
  endif

  return 0
endfunction

" http://nanasi.jp/articles/code/stdplugin/save-cpo.html {{{
let &cpo = s:save_cpo
" }}}
