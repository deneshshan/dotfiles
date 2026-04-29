return {
  {
    "jgdavey/tslime.vim",
    config = function(_)
      vim.cmd [[
        vmap <C-c><C-c> <Plug>SendSelectionToTmux
        nmap <C-c><C-c> <Plug>NormalModeSendToTmux
        nmap <C-c><C-r> <Plug>SetTmuxVars

        nmap <Leader>sc :call Send_to_Tmux("reset && bin/rspec ".expand('%:~:.')."\n")<CR>
        nmap <Leader>se :call Send_to_Tmux("exit\n")<CR>
        nmap <Leader>sr :call Send_to_Tmux("!!\n\n")<CR>
        nmap <Leader>ss :call Send_to_Tmux("reset && bin/rspec ".expand('%:~:.').":".line('.')."\n")<CR>
        nmap <Leader>sv :call Send_to_Tmux("reset && bin/rspec -v ".expand('%:~:.').":".line('.')."\n")<CR>
        nmap <Leader>sa :call Send_to_Tmux("reset && bin/rspec \n")<CR>
      ]]
    end
  }
}
