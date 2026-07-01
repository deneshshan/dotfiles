-- Based on: https://github.com/ntk148v/neovim-config

vim.keymap.set("n", "<Space>", ":", {})
vim.keymap.set("n", "<Tab>", "/", {})

-- Tabs/buffers
vim.keymap.set("n", "<right>", "<cmd>tabn<cr>", {})
vim.keymap.set("n", "<left>", "<cmd>tabp<cr>", {})
vim.keymap.set("n", "<up>", "<cmd>bp<cr>", {})
vim.keymap.set("n", "<down>", "<cmd>bn<cr>", {})
vim.keymap.set("n", "<C-t>", ":tabe %<CR>", {})
vim.keymap.set("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", {})

-- JSON
vim.keymap.set("n", "<leader>jt", ":%!python<Space>-m<Space>json.tool<CR>", {})

--Diff
vim.keymap.set("n", "<leader>dt", ":diffthis<CR>", {})

-- Formatting
vim.keymap.set("n", "<leader>o", ":!tmp/scripts/format.sh<Space>%<CR>:e<CR>")

-- Copying/Pasting
vim.keymap.set('n', '<leader>yp', function()
  local path = vim.fn.expand('%:p')
  local line = vim.fn.line('.')
  vim.fn.setreg('+', path .. ':' .. line)
end)

-- Open current file in Obsidian
local function open_in_obsidian()
  local file = vim.fn.expand('%:p')
  if file == '' then
    vim.notify('No file to open', vim.log.levels.ERROR)
    return
  end

  -- A `.obsidian` directory at the root marks an Obsidian vault. Walk up to find it.
  local found = vim.fs.find('.obsidian', {
    path = vim.fs.dirname(file),
    upward = true,
    type = 'directory',
  })[1]
  if not found then
    vim.notify('Not in an Obsidian vault', vim.log.levels.ERROR)
    return
  end

  local vault_root = vim.fs.dirname(found)
  local vault_name = vim.fn.fnamemodify(vault_root, ':t')
  local rel = file:sub(#vault_root + 2)
  local encoded = rel:gsub('[^A-Za-z0-9/._-]', function(c)
    return string.format('%%%02X', string.byte(c))
  end)
  local uri = string.format('obsidian://open?vault=%s&file=%s', vault_name, encoded)
  vim.fn.system({ 'open', uri })
end

vim.api.nvim_create_user_command('Obsidian', open_in_obsidian, {})

-- Render the current file with mdcat in a new terminal tab. Colours are preserved
-- (nvim's terminal renders the ANSI), you keep full nvim navigation, and yanking
-- grabs clean text with no escape codes. Margins are baked into the output: mdcat
-- wraps narrower than the tab (right margin) and sed indents the left. Run via
-- jobstart with an argv list so the shell pipe isn't parsed by the :terminal command.
local function markdown_view()
  local file = vim.fn.expand('%:p')
  if file == '' then
    vim.notify('No file to render', vim.log.levels.ERROR)
    return
  end
  if vim.fn.executable('mdcat') == 0 then
    vim.notify('mdcat is not installed', vim.log.levels.ERROR)
    return
  end

  local margin = 3
  vim.cmd('tabnew')
  local win = vim.api.nvim_get_current_win()
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn = 'no'

  local cols = math.max(vim.api.nvim_win_get_width(win) - margin * 2, 20)
  local pad = string.rep(' ', margin)
  local pipeline = ('mdcat --columns %d %s | sed %s'):format(
    cols, vim.fn.shellescape(file), vim.fn.shellescape('s/^/' .. pad .. '/'))
  vim.fn.jobstart({ vim.o.shell, vim.o.shellcmdflag, pipeline }, { term = true })
  vim.cmd('stopinsert')
end

vim.api.nvim_create_user_command('Mdv', markdown_view, {})
