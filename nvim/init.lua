-- Disable netrw before any runtime/plugin files load (must be before lazy.setup
-- in config/init.lua), otherwise netrw registers its FileExplorer autocmds and
-- then loaded_netrw blocks the autoload function -> E117 on opening a directory.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has('nvim-0.8') == 0 then
    error('Need Neovim 0.8+ in order to use this config')
end

for _, cmd in ipairs({"git", "rg", {"fd", "fdfind"}}) do
    local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
    local commands = type(cmd) == "string" and {cmd} or cmd
    ---@cast commands string[]
    local found = false

    for _, c in ipairs(commands) do
        if vim.fn.executable(c) == 1 then
            name = c
            found = true
        end
    end

    if not found then
        error(("`%s` is not installed"):format(name))
    end
end

-- Load main config
require("config")
