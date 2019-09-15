if exists('g:loaded_packaddManage')
  finish
endif
let g:loaded_Weather = 1

let s:save_cpo = &cpo
set cpo&vim

function! packaddManage#init() abort
  let s:install_start_path = ''
  let s:install_opt_path = ''
  let s:plugins = []
  if has('nvim')
    let s:install_start_path = $HOME . '/.config/nvim/pack/packaddManage/start/'
    call mkdir()
  elseif exists('*mkdir')
    let s:install_start_path = $HOME . '/.vim/pack/packaddManage/start/'
    let s:install_opt_path = $HOME . '/.vim/pack/packaddManage/opt/'
    call mkdir(s:install_start_path, 'p', 0700)
    call mkdir(s:install_opt_path, 'p', 0700)
  endif
endfunction


command! -nargs=+ -bar StartPlug call packaddManage#addStart(<args>)
command! -nargs=+ -bar OptPlug call packaddManage#addOpt(<args>)

let &cpo = s:save_cpo
unlet s:save_cpo
