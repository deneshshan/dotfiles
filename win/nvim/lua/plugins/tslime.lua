return {
  {
    "jgdavey/tslime.vim",
    config = function(_)
      vim.cmd [[
        vmap <C-c><C-c> <Plug>SendSelectionToTmux
        nmap <C-c><C-c> <Plug>NormalModeSendToTmux
        nmap <C-c><C-r> <Plug>SetTmuxVars

        nmap <Leader>sc :call Send_to_Tmux("reset && rails test -d ".expand('%:~:.')."\n")<CR>
        nmap <Leader>se :call Send_to_Tmux("exit\n")<CR>
        nmap <Leader>sr :call Send_to_Tmux("!!\n\n")<CR>
        nmap <Leader>ss :call Send_to_Tmux("reset && rails test ".expand('%:~:.').":".line('.')."\n")<CR>
        nmap <Leader>sv :call Send_to_Tmux("reset && rails test -v ".expand('%:~:.').":".line('.')."\n")<CR>
        nmap <Leader>sa :call Send_to_Tmux("reset && rails test -d\n")<CR>
      ]]
    end
  }
}
