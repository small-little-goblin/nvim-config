local config = function() require("neoconf").setup({})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- lua 
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
    })

    -- json
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        filetypes = {"json", "jsonc"},
    })

    -- docker
    lspconfig.dockerls.setup({
        capabilities = capabilities,
    })

    -- C/C++
    lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
            "clangd-15",
            "--offset-encoding=utf-16",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
        },
    })

    -- Python
    lspconfig.basedpyright.setup ({
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "all",
                    reportAny = "error",
                    reportUnknownVariableType = "error",
                    reportUnknownParameterType = "error"
                }
            }
        },
    })

    lspconfig.ruff.setup {
        init_options = {
            settings = {
                enable = true,
                ignoreStandardLibrary = true,
                organizeImports       = true,
                fixAll                = true,
                lint = {
                    enable = true,
                    run    = 'onType',
                },
            }
        }
    }
end
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = config,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp", 
    } 
}
