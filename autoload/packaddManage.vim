" Install Plugins in Start

function! packaddManage#addStart(pluginname, ...) abort
  let plugin_url = 'https://github.com/' . a:pluginname
  echomsg plugin_url
  let dir = expand(s:install_start_path . split(plugin_url, '/')[-1])
  if !isdirectory(dir)
    echo 'Start the installation'
    echo printf('git clone %s %s', plugin_url, s:install_start_path)
    echo system(printf('git clone %s %s', plugin_url, dir))
    echo 'Finish'
  endif
  call add(s:plugins, split(plugin_url, '/')[-1])
  echo s:plugins
endfunction

" Install Plugins in Opt

function! packaddManage#addOpt(pluginname, ...) abort
  call packaddManage#init()
  let plugin_url = 'https://github.com/' . a:pluginname
  let dir = expand(s:install_opt_path. split(plugin_url, '/')[-1])
  if !isdirectory(dir)
    echo 'Start the installation'
    echo printf('git clone %s %s', plugin_url, s:install_opt_path)
    echo system(printf('git clone %s %s', plugin_url, dir))
    echo 'Finish'
  endif
  call add(s:plugins, split(plugin_url, '/')[-1])
endfunction

function! packaddManage#Update() abort
  split `='[update plugins]'` | setlocal buftype=nofile
  let s:idx = 0
  call timer_start(100, 'packaddManage#UpdateOpt', {'repeat': len(s:plugins)})
endfunction

function! packaddManage#UpdateOpt(timer)
  let dst = expand(s:install_opt_path . split(s:plugins[s:idx], '/')[-1])
  let cmd = printf('git -C %s pull --ff --ff-only', dst)
  call job_start(cmd, {'out_io': 'buffer', 'out_name': '[update plugins]'})
  let s:idx += 1
endfunction
