" Move line current line down
noremap <leader>- ddp
" Move line current line up
noremap <leader>_ ddkP

" Open vim config file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vim config file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" Move to the next buffer with "gn"
nnoremap gn :bn<CR>

" List all possible buffers with "gl"
nnoremap gl :ls<CR>

" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

" Replace Esc with jk
inoremap jk <ESC>
