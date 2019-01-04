" python
au BufNewFile,BufRead *.py setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent smarttab

" strip trailing whitespace
autocmd BufWritePre *.sh call StripTrailingWhitespace()
