return {
  {
    -- Delete buffers without changing the window layout (maintained
    -- replacement for the archived famiu/bufdelete.nvim).
    "wsdjeg/bufdel.nvim",
    --   :Bdelete  - delete current buffer, keep window layout (! forces past unsaved changes)
    --   :Bwipeout - same, but fully wipes the buffer instead of leaving it unlisted
    --   :BufOnly  - custom (defined below): close all listed buffers except the current one
    cmd = { "Bdelete", "Bwipeout", "BufOnly" },
    config = function()
      -- Close every listed buffer except the current one.
      vim.api.nvim_create_user_command("BufOnly", function()
        require("bufdel").delete(function(buf)
          return vim.bo[buf].buflisted and buf ~= vim.api.nvim_get_current_buf()
        end, {})
      end, { desc = "Delete all buffers except the current one" })
    end,
  },
}
