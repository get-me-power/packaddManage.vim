function! Test(plug, ...) abort
  " let dst = expand('~/.vim/pack/packaddManage/start/')
  let l:plugin_name = split(a:plug, '/')[-1]
  echo l:plugin_name
endfunction

command! -nargs=+ -bar Plugin call Test(<args>)
