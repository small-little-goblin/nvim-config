return {
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls"},
                automatic_installation = true,
            })
        end
    }
}
