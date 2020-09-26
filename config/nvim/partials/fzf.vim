" fzf {{{
if WINDOWS()
  let $FZF_DEFAULT_OPTS=' --no-height'
else
  let $FZF_DEFAULT_OPTS='--height 30% --layout=reverse --border --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'
endif
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
nnoremap <C-p> :Files<CR>
" }}}
