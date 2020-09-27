" defx {{{
" https://github.com/kristijanhusak/neovim-config/blob/master/nvim/partials/defx.vim
augroup vimrc_defx
  autocmd!
  autocmd FileType defx call s:defx_mappings()        " Defx mappings
  autocmd VimEnter * call s:setup_defx()
augroup END
" nnoremap <silent><C-e> :call <sid>defx_open({ 'split': v:true, 'find_current_file': v:true })<CR>
nnoremap <silent><C-e> :call <sid>defx_open({ 'split': v:true })<CR>
let s:default_columns = 'indent:git:icons:filename'

function! s:setup_defx() abort
  call defx#custom#option('_', {
        \ 'columns': s:default_columns,
        \ 'toggle': 1,
        \ 'resume': 1,
        \ 'ignored_files':
        \     '.git,.hg,.svn,__pycache__,.sass-cache,.DS_Store,*.egg-info'
        \   . ',*.pyc,*.exe'
        \ })

  call defx#custom#column('filename', {
        \ 'min_width': 36,
        \ 'max_width': 36,
        \ })
  call defx#custom#column('git', 'indicators', {
        \ 'Modified'  : '✹',
        \ 'Staged'    : '✚',
        \ 'Untracked' : '✭',
        \ 'Renamed'   : '➜',
        \ 'Unmerged'  : '═',
        \ 'Deleted'   : '✖',
        \ 'Unknown'   : '?'
        \ })

  call s:defx_open({ 'dir': expand('<afile>') })
endfunction

function! s:get_project_root() abort
  let l:git_root = ''
  let l:path = expand('%:p:h')
  let l:cmd = systemlist('cd '.l:path.' && git rev-parse --show-toplevel')
  if !v:shell_error && !empty(l:cmd)
    let l:git_root = fnamemodify(l:cmd[0], ':p:h')
  endif

  if !empty(l:git_root)
    return l:git_root
  endif

  return getcwd()
endfunction

function! s:defx_open(...) abort
  let l:opts = get(a:, 1, {})
  let l:path = get(l:opts, 'dir', s:get_project_root())

  if !isdirectory(l:path) || &filetype ==? 'defx'
    return
  endif

    let l:args = '-winwidth=36 -direction=topleft'

  if has_key(l:opts, 'split')
    let l:args .= ' -split=vertical'
  endif

  if has_key(l:opts, 'find_current_file')
    if &filetype ==? 'defx'
      return
    endif
    call execute(printf('Defx %s -toggle -focus -search=%s %s', l:args, expand('%:p'), l:path))
  else
    call execute(printf('Defx -toggle -focus %s %s', l:args, l:path))
  endif

  " return execute("norm!\<C-w>=")
endfunction

function! s:defx_context_menu() abort
  let l:actions = ['new_multiple_files', 'rename', 'copy', 'move', 'paste', 'remove']
  let l:selection = confirm('Action?', "&Add file/directory\n&Rename\n&Copy\n&Move\n&Paste\n&Delete")
  silent exe 'redraw'

  return feedkeys(defx#do_action(l:actions[l:selection - 1]))
endfunction

function! s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction

function! s:defx_mappings() abort
  setlocal number
  nnoremap <silent><buffer>m :call <sid>defx_context_menu()<CR>
  nnoremap <silent><buffer><expr> o <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> <CR> <sid>defx_toggle_tree()
  nnoremap <silent><buffer><expr> C defx#is_directory() ? defx#do_action('multi', ['open', 'change_vim_cwd']) : 'C'
  nnoremap <silent><buffer><expr> s defx#do_action('open', 'botright vsplit')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> U defx#do_action('multi', [['cd', '..'], 'change_vim_cwd'])
  nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> tt defx#do_action("toggle_columns", "'.s:default_columns.':size")
endfunction
" }}}
