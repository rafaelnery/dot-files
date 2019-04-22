
"
" Author: Rafael Serpa Nery<rafanery0@gmail.com>
" vim: set sw=2 ts=2 sts=2 et tw=100 foldmarker={,} foldlevel=0 foldmethod=marker:
"

let $PLUGDIR='~/.vim/plugged'

if has('nvim') 
 let $PLUGDIR=$PLUGDIR.'/nvim'
else 
 let $PLUGDIR=$PLUGDIR.'/vim'
endif 

call plug#begin($PLUGDIR)

" Core {
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ervandew/supertab'
  Plug 'eugen0329/vim-esearch'
  Plug 'jiangmiao/auto-pairs'
  Plug 'luochen1990/rainbow'
  Plug 'mhinz/vim-signify'
  Plug 'scrooloose/nerdtree'
  Plug 'sjl/gundo.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'othree/eregex.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/groovy.vim'
  Plug 'majutsushi/tagbar'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Shougo/denite.nvim'
  Plug 'ctrlpvim/ctrlp.vim'  
  Plug 'editorconfig/editorconfig-vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Shougo/neco-vim'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'neoclide/coc-neco'
" }
" CSS, SASS, SCSS e OTHERS {
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
" }

" Colors {
  Plug 'morhetz/gruvbox'
  Plug 'jefersonbelmiro/vim-womprat'
  Plug 'tomasr/molokai'
" }
call plug#end()

source $CONFIG_DIR/plugins.config.vim
