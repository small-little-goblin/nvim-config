return {
  {
    "hrsh7th/nvim-cmp", -- main completion plugin
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-buffer",       -- buffer words
      "hrsh7th/cmp-path",         -- filesystem paths
      "saadparwaiz1/cmp_luasnip", -- snippets
      "L3MON4D3/LuaSnip",         -- snippet engine
      "rafamadriz/friendly-snippets" -- community snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_select = {behavior = cmp.SelectBehavior.Select }
      -- Load VSCode-style snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
          ["<Tab>"] = nil,
          ["<S-Tab>"] = nil,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
        {
          { name = "buffer" },
        }),
      })
    end
    }
}
