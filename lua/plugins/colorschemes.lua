return {
    {"EdenEast/nightfox.nvim"},
    {"bluz71/vim-moonfly-colors"},
    {"lu-ren/SerialExperimentsLain"},
    {"folke/tokyonight.nvim",
    lazy = false,
    priority = 999,
    config = function()
       vim.cmd.colorscheme("SerialExperimentsLain")
    end,
    },
}

