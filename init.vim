set nocompatible

let g:python_host_prog = '/Users/juub/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/juub/.pyenv/versions/neovim3/bin/python'

" === Plugins ===
call plug#begin()

source ~/.config/nvim/vimrc.plugs
source ~/.config/nvim/coc.vim

call plug#end()

syntax enable
set number

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" === Plugin settings ===

let g:deoplete#sources#flow#flow_bin = g:flow_path
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview

" == neomake/neomake ==
let g:neomake_warning_sign = {
\ 'text': 'W',
\ 'texthl': 'WarningMsg',
\ }
let g:neomake_error_sign = {
\ 'text': 'E',
\ 'texthl': 'ErrorMsg',
\ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']

let g:neomake_javascript_flow_exe = g:flow_path
let g:neomake_jsx_flow_exe = g:flow_path

autocmd! BufWritePost * Neomake

let g:session_autoload = 'no'


" === Keybindings ===

" == junegunn/fzf ==
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" == scrooloose/nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

source ~/.config/nvim/vimrc.local
