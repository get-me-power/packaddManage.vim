" 初回読み込み用のディレクトリ作成
function! CreateFirstDir() abort
  if exists("*mkdir")
    call mkdir($HOME . "/.vim/pack/packaddManage/start", "p", 0700)
  endif
endfunction

" Install Plugins

function! InstallPlugins() abort
  for url in s:plugins
    let dst = expand('~/.vim/pack/packaddManage/start/')
  endfor
endfunction
