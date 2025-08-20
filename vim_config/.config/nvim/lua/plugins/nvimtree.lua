return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {
            -- 你的其他 nvim-tree 配置…
        }
        
        vim.keymap.set('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}