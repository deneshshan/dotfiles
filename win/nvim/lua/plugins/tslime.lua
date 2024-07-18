return {
  {
    "jgdavey/tslime.vim",
    config = function(_)
      vim.cmd [[
        vmap <C-c><C-c> <Plug>SendSelectionToTmux
        nmap <C-c><C-c> <Plug>NormalModeSendToTmux
        nmap <C-c><C-r> <Plug>SetTmuxVars

        nmap <Leader>c :call Send_to_Tmux("reset && rails test -d ".expand('%:~:.')."\n")<CR>
        nmap <Leader>e :call Send_to_Tmux("exit\n")<CR>
        nmap <Leader>r :call Send_to_Tmux("!!\n\n")<CR>
        nmap <Leader>s :call Send_to_Tmux("reset && rails test ".expand('%:~:.').":".line('.')."\n")<CR>
        nmap <Leader>v :call Send_to_Tmux("reset && rails test -v ".expand('%:~:.').":".line('.')."\n")<CR>
        nmap <Leader>a :call Send_to_Tmux("reset && rails test -d\n")<CR>
      ]]
    end
  }
}
