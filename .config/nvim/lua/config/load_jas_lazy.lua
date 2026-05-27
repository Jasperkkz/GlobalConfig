local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local plugin_files = vim.fn.stdpath("config") .. "/lua/plugins"

-- 遍历 plugins 目录下所有 .lua 文件并 require
for _, file in ipairs(vim.fn.readdir(plugin_files)) do
    if file:match("%.lua$") then
        local name = file:gsub("%.lua$", "")
        table.insert(plugins, require("plugins." .. name))
    end
end

require("lazy").setup(plugins)
