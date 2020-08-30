source ~/.vimrc_base

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
" => Pmenu
""""""""""""""""""""""""""""""
highlight Pmenu ctermfg=black guifg=black ctermbg=gray guibg=gray

""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
    \ {'source': '$FZF_ALT_C_COMMAND',
    \ 'sink': 'cd'}))
execute "set <M-c>=\ec"
nnoremap <M-c> :Cd<CR>

""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/emmet-vim
set runtimepath^=~/.vim/vim-airline
set runtimepath^=~/.vim/vim-commentary
set runtimepath^=~/.vim/vim-surround
set runtimepath^=~/.vim/vim-tmux-navigator
set runtimepath^=~/.vim/fzf
set runtimepath^=~/.vim/fzf.vim
set runtimepath^=~/.vim/fugitive
set runtimepath^=~/.vim/vifm.vim

""""""""""""""""""""""""""""""
" => Vim tree
""""""""""""""""""""""""""""""
let g:vifm_exec_args = '-c :only'
let g:vifm_embed_split = 1
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
command! Vf :vertical 50 Vifm .
cnoreabbrev vf Vf

""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""
" command! Commits
" command! Gblame
command! Diffs :Git difftool -y
command! Diff :Gdiff
command! Commit :BCommits

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Json :%!python -m json.tool
au BufRead,BufNewFile *.aMod set filetype=oberon
au! Syntax oberon source ~/.vim/oberon2.vim

""""""""""""""""""""""""""""""
" => Shortcuts
""""""""""""""""""""""""""""""
nnoremap <C-w>t :vertical 50 Vifm<CR>
nnoremap <C-w>b :Buffers<CR>
nnoremap <C-f> :Rg 
nnoremap <C-t> :Files<CR>

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
" nmap <silent> gs 'Go to super definition'

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Organize imports of the current buffer.
nnoremap <leader>i :call CocAction('runCommand', 'editor.action.organizeImport')<CR>

" Format current buffer.
nnoremap <leader>F :call CocAction('format')<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Others
" nmap <silent> gy <Plug>(coc-type-definition)
" Remap keys for applying codeAction to the current buffer.
" nmap <leader>a  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

