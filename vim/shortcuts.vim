function! NerdToggle() 
  if g:NERDTree.IsOpen() 
    :NERDTreeToggle
  else 
     if bufexists(expand('%')) 
       :NERDTreeFind
     else 
       :NERDTreeToggle
     endif
  endif
endfunction

let mapleader = ","

imap <F2> <esc>:w<CR>
map <F2> :w<CR>

map <leader>u :GundoToggle<CR>
map <leader>t :call NerdToggle()<CR>

map <leader>p :set paste!<CR>


" Remover palavra a esquerda ou a direita  no modo inserção com CTRL + DEL ou CTRL + BACKSPACE {
  imap <C-Del> <C-o>dw
  imap <C-Backspace> <C-o>
" }

if has("gui_running")
"  inoremap <C-Space> <C-x><C-o>
  inoremap <silent><expr> <c-space> coc#refresh()

else 
  if has("unix")
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <silent><expr> <c-@> coc#refresh()
    inoremap <Nul> coc#refresh()
  endif
endif

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Buffers {
map <leader>b :CtrlPBuffer<CR>
map <leader>h :bprevious<CR>
map <leader>l :bnext<CR>
map <C-Tab> :bnext<CR>
map <F4> <esc>:bdelete<CR>
" }
"
" Gotos {
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"}
