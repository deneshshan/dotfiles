return {
  {
    'gabesoft/vim-ags',
    version = "*",
    config = function()
      vim.cmd([[
        " Search for the word under cursor
        nnoremap <Leader>b :Ags<Space><C-R>=expand('<cword>')<CR><CR>
        " Search for the visually selected text
        vnoremap <Leader>b y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
      ]])
    end,
  }
}
