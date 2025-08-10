local api = vim.api

-- Highlight text on yank
api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- Return to last edit position when opening files
api.nvim_create_autocmd("BufReadPost", {
    desc = "Go to last location when opening a file",
    callback = function()
        local mark = api.nvim_buf_get_mark(0, '"')
        local lcount = api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Automatically resize splits when the window is resized
api.nvim_create_autocmd("VimResized", {
    desc = "Resize splits when window is resized",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
