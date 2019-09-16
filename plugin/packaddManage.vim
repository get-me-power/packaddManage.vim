if exists('g:loaded_packaddManage')
  finish
endif
let g:loaded_Weather = 1

let s:save_cpo = &cpo
set cpo&vim

function! packaddManage#init() abort
  let s:install_start_path = ''
  let s:install_opt_path = ''
  let s:start_plugins = []
  let s:opt_plugins = []
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
  let plugin_url = 'https://github.com/' . a:pluginname
  let dir = expand(s:install_start_path . split(plugin_url, '/')[-1])
  if !isdirectory(dir)
    echo 'Start the installation'
    echo printf('git clone %s %s', plugin_url, s:install_start_path)
    call system(printf('git clone %s %s', plugin_url, dir))
    echo 'Finish'
  endif
  call add(s:start_plugins, split(plugin_url, '/')[-1])
  echo s:start_plugins
endfunction

" Install Plugins in Opt

function! packaddManage#addOpt(pluginname, ...) abort
  let plugin_url = 'https://github.com/' . a:pluginname
  let dir = expand(s:install_opt_path. split(plugin_url, '/')[-1])
  if !isdirectory(dir)
    echo 'Start the installation'
    echo printf('git clone %s %s', plugin_url, s:install_opt_path)
    call system(printf('git clone %s %s', plugin_url, dir))
    echo 'Finish'
  endif
  call add(s:opt_plugins, split(plugin_url, '/')[-1])
  echo s:opt_plugins
endfunction

function! packaddManage#Update() abort
  split `='[update plugins]'` | setlocal buftype=nofile
  let s:start_idx = 0
  let s:opt_idx = 0
  call timer_start(100, 'packaddManage#UpdateHundleStart', {'repeat': len(s:start_plugins)})
  call timer_start(100, 'packaddManage#UpdateHundleOpt', {'repeat': len(s:opt_plugins)})
endfunction

function! packaddManage#UpdateHundleOpt(timer)
  let dst = expand(s:install_opt_path . split(s:opt_plugins[s:opt_idx], '/')[-1])
  echomsg dst
  let cmd = printf('git -C %s pull --ff --ff-only', dst)
  call job_start(cmd, {'out_io': 'buffer', 'out_name': '[update plugins]'})
  let s:start_idx += 1
endfunction

function! packaddManage#UpdateHundleStart(timer)
  let dst = expand(s:install_start_path . split(s:start_plugins[s:start_idx], '/')[-1])
  echomsg dst
  let cmd = printf('git -C %s pull --ff --ff-only', dst)
  call job_start(cmd, {'out_io': 'buffer', 'out_name': '[update plugins]'})
  let s:opt_idx += 1
endfunction

command! -nargs=+ -bar StartPlug call packaddManage#addStart(<args>)
command! -nargs=+ -bar OptPlug call packaddManage#addOpt(<args>)
command! -nargs=0 UpdatePlugin call packaddManage#Update()

let &cpo = s:save_cpo
unlet s:save_cpo
