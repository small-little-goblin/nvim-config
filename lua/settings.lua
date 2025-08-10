-- [[ General ]]
vim.opt.mouse = "a"                      -- Enable mouse support
vim.opt.clipboard = "unnamedplus"        -- Use system clipboard
vim.opt.swapfile = false                  -- Don't use swap files
vim.opt.backup = false                    -- No backup files
vim.opt.undofile = true                   -- Persistent undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.history = 1000                    -- Command history size
vim.opt.confirm = true

-- [[ UI ]]
vim.opt.number = true                     -- Show line numbers
vim.opt.relativenumber = true             -- Relative numbers for movement
vim.opt.cursorline = true                 -- Highlight current line
vim.opt.signcolumn = "yes"                -- Always show sign column
vim.opt.wrap = false                      -- Don't wrap long lines
vim.opt.scrolloff = 999                   -- Keep cursor in middle of screen
vim.opt.sidescrolloff = 8                 -- Keep columns left/right of cursor
vim.opt.showmode = false                  -- Don't show --INSERT-- (statusline handles it)
vim.opt.termguicolors = true               -- Enable 24-bit colors

-- [[ Tabs & Indentation ]]
vim.opt.expandtab = true                  -- Use spaces instead of tabs
vim.opt.tabstop = 4                        -- Number of spaces per TAB
vim.opt.shiftwidth = 4                     -- Indent width
vim.opt.softtabstop = 4                    -- How many spaces when hitting TAB in insert mode
vim.opt.smartindent = true                 -- Smart autoindenting
vim.opt.autoindent = true

-- [[ Searching ]]
vim.opt.ignorecase = true                  -- Case-insensitive search...
vim.opt.smartcase = true                   -- ... unless capital letters in query
vim.opt.hlsearch = true                    -- Highlight search results
vim.opt.incsearch = true                   -- Show search matches as you type

-- [[ Splits ]]
vim.opt.splitright = true                  -- Vertical split to the right
vim.opt.splitbelow = true                  -- Horizontal split below

-- [[ Performance ]]
vim.opt.updatetime = 250                   -- Faster completion
vim.opt.timeoutlen = 500                   -- Shorter keymap timeout

-- [[ Misc ]]
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Completion options
vim.opt.virtualedit = "block"
vim.opt.conceallevel = 0                   -- Don't hide `` in markdown
