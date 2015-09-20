" autoload/nox/editing.vim - Global helpers for editing tasks
" Maintainer:   Noah Frederick

" Execute commands without moving cursor, changing search pattern
"
" - First parameter is a function name to call as a string
" - Second (optional) parameter is an array of arguments to pass to the
"   function
function! nox#editing#preserve(func, ...)
  let l:FuncRef = function(a:func)
  if a:0 > 0
    let l:args = a:1
  else
    let l:args = []
  endif

  let l:saved_search = @/
  let l:saved_view = winsaveview()

  let l:return_value = call(l:FuncRef, l:args)

  call winrestview(l:saved_view)
  let @/ = l:saved_search

  return l:return_value
endfunction

function! s:normalize_whitespace()
  " 1. Strip trailing whitespace
  %substitute/\s\+$//e
  " 2. Merge consecutive blank lines
  %substitute/\n\{3,}/\r\r/e
  " 3. Strip empty line from end of file
  %substitute/\n\+\%$//e
endfunction

function! nox#editing#normalize_whitespace()
  return nox#editing#preserve('<SID>normalize_whitespace')
endfunction

function! s:reindent_buffer()
  normal! gg=G
endfunction

function! nox#editing#reindent_buffer()
  return nox#editing#preserve('<SID>reindent_buffer')
endfunction

function! s:yank_buffer()
  normal! ggyG
endfunction

function! nox#editing#yank_buffer()
  return nox#editing#preserve('<SID>yank_buffer')
endfunction

function! nox#editing#normal_mode_digraph(char2)
  let l:char1 = matchstr(getline('.'), '.', byteidx(getline('.'), col('.') - 1))
  echo 'digraph: ' . l:char1 . a:char2
  return "r\<C-k>" . l:char1 . a:char2
endfunction

function! nox#editing#set_indent_style(width, expandtab) abort
  let &l:shiftwidth  = a:width
  let &l:softtabstop = a:width
  let &l:tabstop     = a:width
  let &l:expandtab   = a:expandtab ? 1 : 0
endfunction

" vim: fdm=marker:sw=2:sts=2:et
