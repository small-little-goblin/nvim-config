local keymap = vim.keymap
-- Tree Directory Navigation
keymap.set("n", "<Leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Pane Navigation
keymap.set("n", "<c-h>", "<c-w>h", {noremap = true, silent = true}) --navigate left
keymap.set("n", "<c-l>", "<c-w>l", {noremap = true, silent = true}) --navigate right
keymap.set("n", "<c-j>", "<c-w>j", {noremap = true, silent = true}) --navigate down
keymap.set("n", "<c-k>", "<c-w>k", {noremap = true, silent = true}) --navigate up

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", {noremap = true, silent = true})          -- Split vertically
keymap.set("n", "<leader>sh", ":split<CR>", {noremap = true, silent = true})           -- Split horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", {noremap = true, silent = true}) -- Toggle Maximize/Minimize

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Diagnostics
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {noremap = true, silent = true, buffer = event.buf }

        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
})

