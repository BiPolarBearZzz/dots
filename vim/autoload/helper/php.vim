" autoload/helper/php.vim - PHP helpers

let s:php_source_prefixes = [
  \ 'application/classes/',
  \ 'application/tests/',
  \ 'src/main/php/',
  \ 'src/main/',
  \ 'src/',
  \ 'lib/',
  \ ]

let s:php_source_segments = [
  \ ['/tests/', 'Tests'],
  \ ['/Controller/', 'Controllers'],
  \ ['/Model/', 'Models'],
  \ ['/Task/', 'Tasks'],
  \ ['/View/', 'Views'],
  \ ]

" Infer the PSR-0 class name from file's path.
" Example:
"   classes/HTTP/Request.php -> HTTP_Request
function! helper#php#PathToClassName(path)
  let l:path = a:path
  for l:prefix in s:php_source_prefixes
    if stridx(l:path, l:prefix) == 0
        let l:path = strpart(l:path, strlen(l:prefix))
        break
    endif
  endfor
  return substitute(fnamemodify(l:path, ":r"), '/', '_', 'g')
endfunction

" Make an intelligent guess about the parent class name based on file's path.
function! helper#php#PathToParentClassName(path)
  let l:path = a:path
  if stridx(l:path, "/tests/") != -1
    return "PHPUnit_Framework_TestCase"
  endif
  return "ParentClass"
endfunction

" Derive class name from test class name
" Example:
"   HTTP_RequestTest -> HTTP_Request
function! helper#php#TestClassNameToClassName(className)
  return substitute(a:className, 'Test$', '', '')
endfunction

" Derive test class name from class name
" Example:
"   HTTP_Request -> HTTP_RequestTest
function! helper#php#ClassNameToTestClassName(className)
  return a:className.'Test'
endfunction

" Generate a generic description for test case
function! helper#php#GetTestCaseDescription()
  let className = helper#php#PathToClassName()
  let className = helper#php#TestClassNameToClassName(className)

  return 'Test case for class '.className
endfunction

" Derive class category from file's path
function! helper#php#PathToClassCategory(path)
  for [segment, category] in s:php_source_segments
    if stridx(a:path, l:segment) != -1
      return l:category
    endif
  endfor
  return "Helpers"
endfunction

" vim: fdm=marker:sw=2:sts=2:et