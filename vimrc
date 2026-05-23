set termguicolors
colorscheme nachtwald
set autoindent
set tabstop=2
set shiftwidth=2
set relativenumber
set cursorline

function! s:get_syn_info()
	let l:s = synID(line('.'), col('.'), 1)
		echo printf("hi<%s> trans<%s> lo<%s>",
			\synIDattr(l:s, "name"),
			\synIDattr(synIDtrans(l:s), "name"),
			\synIDattr(synID(line('.'), col('.'), 0), "name"))
endfunction
command! GetSyntax call s:get_syn_info()

let g:lsp_settings = {
	\'gopls': {
		\'initialization_options': {
			\'semanticTokens': v:true,
		\}
	\}
\}

call plug#begin('~/.vim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dart-lang/dart-vim-plugin'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

let g:lsp_semantic_enabled = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 0
