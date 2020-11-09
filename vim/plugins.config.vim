" Author: Rafael Serpa Nery<rafael@nery.info>
"
" vim: set sw=2 ts=2 sts=2 et tw=100 foldmarker={,} foldlevel=0 foldmethod=marker:

" C
" Airline {
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = "\uE0C0"
  let g:airline_right_sep = "\uE0C2"
  let g:airline_mode_map = {
        \ '__'     : '-',
        \ 'c'      : 'C',
        \ 'i'      : 'I',
        \ 'ic'     : 'I',
        \ 'ix'     : 'I',
        \ 'n'      : 'N',
        \ 'multi'  : 'M',
        \ 'ni'     : 'N',
        \ 'no'     : 'N',
        \ 'R'      : 'R',
        \ 'Rv'     : 'R',
        \ 's'      : 'S',
        \ 'S'      : 'S',
        \ ''     : 'S',
        \ 't'      : 'T',
        \ 'v'      : 'V',
        \ 'V'      : 'V',
        \ ''     : 'V',
        \ }

" }

" VimESearch {
  
  let g:esearch = { 'default_mappings': 1, 'adapter': 'rg', 'regex': 1, 'recover_regex': 1 }
  let g:esearch#out#win#open = 'enew'
" }

" NerdTree  {
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeIgnore = ['\~$', 'vendor', 'node_modules', 'dist', 'build']
" }

" TagBar {
  let g:tagbar_type_typescript = {                                                  
    \ 'ctagsbin' : 'tstags',                                                        
    \ 'ctagsargs' : '-f-',                                                           
    \ 'kinds': [                                                                     
      \ 'e:enums:0:1',                                                               
      \ 'f:function:0:1',                                                            
      \ 't:typealias:0:1',                                                           
      \ 'M:Module:0:1',                                                              
      \ 'I:import:0:1',                                                              
      \ 'i:interface:0:1',                                                           
      \ 'C:class:0:1',                                                               
      \ 'm:method:0:1',                                                              
      \ 'p:property:0:1',                                                            
      \ 'v:variable:0:1',                                                            
      \ 'c:const:0:1',                                                              
    \ ],                                                                            
    \ 'sort' : 0                                                                    
  \ }                                                                               
  " }
  
" CoC {
" }

" Denite {
try

  call denite#custom#option('default', {
        \ 'auto_resume': 1,
        \ 'winheight': 15,
        \ 'reversed': 1,
        \ 'prompt': '❯ ',
        \ 'start_filter': 1,
        \ })

  augroup ps_denite_setup
    au!
    au FileType denite-filter call s:denite_filter_mappings()
  augroup END
  function! s:denite_filter_mappings() abort
    inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer> <C-j>
          \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-k>
          \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
  endfunction


  call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])


  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])

  call denite#custom#map('insert', '<Down>',   '<denite:move_to_next_line>',     'noremap')
  call denite#custom#map('insert', '<Up>',     '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<Delete>', '<denite:do_action:delete>',      'noremap')

  call denite#custom#option('_', 'split', 'floating')

	call denite#custom#source('file/rec', 'matchers', ['converter/tail_path', 'matcher/fuzzy'])

  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q       denite#do_map('quit')
    nnoremap <silent><buffer><expr> <esc>   denite#do_map('quit')
    nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select')
  endfunction

catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

"}

" LightLine {

let g:lightline_buffer_enable_devicons  = 1
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[Novo Arquivo]'
let g:lightline = {}
let g:lightline.colorscheme        = 'default' 
let g:lightline.separator          = { 'left': "\ue0c6", 'right': "\ue0c7" }
let g:lightline.subseparator       = { 'left': "\ue0b5", 'right': "\ue0b7" }
let g:lightline.component_function = { 
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentFunction' : 'CocCurrentFunction',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ }
let g:lightline.tabline = {
      \  'left': [ [ 'bufferinfo' ],
      \            [ 'separator' ],
      \            [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], 
      \  ],
      \  'right': [ [ 'close' ], ],
      \ }
let g:lightline.component_expand = {
      \  'buffercurrent': 'lightline#buffer#buffercurrent',
      \  'bufferbefore': 'lightline#buffer#bufferbefore',
      \  'bufferafter': 'lightline#buffer#bufferafter'
      \ }

let g:lightline.component_type = {
      \  'buffercurrent': 'tabsel',
      \  'bufferbefore': 'raw',
      \  'bufferafter': 'raw'
      \ }

let g:lightline.component = {
      \  'separator': '',
      \ }
let g:lightline.active  = { 'left': [
      \   [ 'mode', 'paste' ],
      \   [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] 
      \ ]}

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" }
