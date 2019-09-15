function! packaddManage#init() abort
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

" Install Plugins in Start

function! packaddManage#addStart(pluginname, ...) abort
  call packaddManage#init()
  let plugin_url = 'https://github.com/' . a:pluginname
  echomsg plugin_url
  let dir = expand(s:install_start_path . split(plugin_url, '/')[-1])
  if !isdirectory(dir)
    echo 'Start the installation'
    echo printf('git clone %s %s', plugin_url, s:install_start_path)
    echo system(printf('git clone %s %s', plugin_url, dir))
    echo 'Finish'
  endif
endfunction

" Install Plugins in Opt

function! packaddManage#addOpt(pluginname, ...) abort
  call packaddManage#init()
  let plugin_url = 'https://github.com/' . a:pluginname
  echomsg plugin_url
  let dir = expand(s:install_opt_path . split(plugin_url, '/')[-1])
  if !isdirectory(dir)
    echo 'Start the installation'
    echo printf('git clone %s %s', plugin_url, s:install_opt_path)
    echo system(printf('git clone %s %s', plugin_url, dir))
    echo 'Finish'
  endif
endfunction

command! -nargs=+ -bar StartPlug call packaddManage#addStart(<args>)
command! -nargs=+ -bar OptPlug call packaddManage#addOpt(<args>)
