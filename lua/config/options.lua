-- Linenumbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation/Tab
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.o.expandtab = true
vim.opt.wrap = false

--Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.opt.inccommand = "split"

--Appearance
vim.opt.scrolloff = 999
vim.opt.clipboard = "unnamedplus"
vim.opt.virtualedit = "block"
vim.opt.termguicolors = true
vim.o.completeopt = 'menuone,noselect'

--Behaviour
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.o.mouse = 'a'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

-- Add :ToggleBG
local state_bg = false
function toggleBG()
    if state_bg == false then
        -- Set background to None and remember the previous value
        --vim.cmd("hi Normal guibg=None ctermbg=None") -- I think this does the same thing as the next 2 lines
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        vim.api.nvim_command("hi LineNr guifg=#ABB2BF")
        state_bg = true
    else
        vim.cmd('colorscheme ' .. vim.g.colors_name)       
        state_bg = false
    end
end
vim.cmd("command! ToggleBG lua toggleBG()")
vim.cmd([[autocmd BufReadPost * lua toggleBG()]]) -- Autostarts ToggleBG when file is opened


