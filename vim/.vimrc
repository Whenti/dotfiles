source ~/.vimrc_base

""""""""""""""""""""""""""""""
" => Miscellaneous
""""""""""""""""""""""""""""""
set wrap
set linebreak
set showbreak=>\ \ \
tnoremap <c-x> <c-\><c-n>
autocmd BufWritePre * %s/\s\+$//e
set shortmess=I
set cmdheight=2
nnoremap <C-q> :wqa<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

""""""""""""""""""""""""""""""
" => persistent undo
""""""""""""""""""""""""""""""
set undodir=~/.vim/undodir
set undofile

""""""""""""""""""""""""""""""
" => Style
""""""""""""""""""""""""""""""
highlight Pmenu ctermfg=black ctermbg=white cterm=NONE guifg=NONE guibg=#64666d gui=NONE
highlight DiffAdd    cterm=bold ctermfg=2 ctermbg=233 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=2 ctermbg=233 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=2 ctermbg=233 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=2 ctermbg=88  gui=none guifg=bg guibg=Red

""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
    \ {'source': '$FZF_ALT_C_COMMAND',
    \ 'sink': 'cd'}))

if !has('nvim')
    execute "set <M-c>=\ec"
endif
nnoremap <M-c> :Cd<CR>

""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/emmet-vim
set runtimepath^=~/.vim/vim-commentary
set runtimepath^=~/.vim/vim-surround
set runtimepath^=~/.vim/vim-tmux-navigator
set runtimepath^=~/.vim/fzf
set runtimepath^=~/.vim/fzf.vim
set runtimepath^=~/.vim/vifm.vim

""""""""""""""""""""""""""""""
" => Vim tree
""""""""""""""""""""""""""""""
let g:vifm_exec_args = '-c :only'
let g:vifm_embed_split = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

""""""""""""""""""""""""""""""
" => Tig
""""""""""""""""""""""""""""""
command! Blame :execute "!tig blame +" . line(".") . " %"
command! Diffs :!tig status
command! Diff :!git difftool --tool=vimdiff --no-prompt %
command! Log :!tig %
command! Logs :!tig

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Oberon
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.aMod set filetype=oberon
au! Syntax oberon source ~/.vim/oberon2.vim

""""""""""""""""""""""""""""""
" => Shortcuts
""""""""""""""""""""""""""""""
nnoremap <C-s> :Rg<Space>
nnoremap <C-t> :Files<CR>
nmap <C-f> :vertical 50 Vifm<CR>
nnoremap <C-w><C-w> :History<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pyqo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=1 C :execute 'cd' system('d '.<f-args>.' -e')
cnoreabbrev c C
command! -nargs=1 F :execute 'edit' system('f '.<f-args>.' -e')
cnoreabbrev f F

""""""""""""""""""""""""""""""
" => Coc plugin
""""""""""""""""""""""""""""""
let g:coc_disable_startup_warning = 1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Organize imports of the current buffer.
nnoremap <leader>i :call CocAction('runCommand', 'editor.action.organizeImport')<CR>

" Format current buffer.
nnoremap <leader>f :call CocAction('format')<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

