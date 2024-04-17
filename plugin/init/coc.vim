" let g:coc_global_extensions = [
"       \ 'coc-json',
"       \ 'coc-sh',
"       \ 'coc-go',
"       \ 'coc-lua',
"       \ 'coc-clangd',
"       \ 'coc-tsserver',
"       \ 'coc-snippets']
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   " inoremap <silent><expr> <c-@> coc#refresh()
"   inoremap <silent> <c-@> <c-r>=coc#refresh()<cr>
" endif

" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
