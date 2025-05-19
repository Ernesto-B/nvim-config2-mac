-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

---------------------------------------------------------
-- Setting the shell to bash
---------------------------------------------------------
-- vim.opt.shell = "C:\\PROGRA~1\\Git\\bin\\bash.exe"
-- vim.opt.shellcmdflag = "-c" -- Ensures commands are executed correctly
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

-- use the DOS 8.3 short‐path to avoid the space
-- vim.opt.shell = "C:/PROGRA~1/Git/bin/bash.exe"
-- tell bash to be interactive (-i) and accept a command (-c)
-- vim.opt.shellcmdflag = "-c"
-- no extra quoting needed
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""
-- keep the default redirects/pipes so `:!` and `:term` still work
-- vim.opt.shellredir = "-c %s 2>&1"
-- vim.opt.shellpipe = "2>&1| tee"

---------------------------------------------------------
-- File Names - NOT SURE IF WORKING
---------------------------------------------------------
vim.opt.isfname:append("@-@") -- Treat @-@ as part of filenames in search
vim.opt.isfname:append(".") -- Treat . as part of filenames in search?? Not sure if working

---------------------------------------------------------
-- Performance
---------------------------------------------------------
vim.opt.updatetime = 50 -- Faster updates (good for CursorHold, etc.)

---------------------------------------------------------
-- Colors
---------------------------------------------------------
vim.opt.colorcolumn = "80" -- Vertical line at col=80
vim.opt.termguicolors = true -- True color support

---------------------------------------------------------
-- Search
---------------------------------------------------------
vim.opt.hlsearch = true -- Show highlight all search matches
vim.opt.incsearch = true -- Show matches as you type

---------------------------------------------------------
-- Indentation
---------------------------------------------------------
vim.opt.tabstop = 4 -- Visual width of tabs
vim.opt.softtabstop = 4 -- Auto-indent uses 4 spaces
vim.opt.shiftwidth = 4 -- <<, >> shift by 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart indentation on new lines

---------------------------------------------------------
-- Line Numbers
---------------------------------------------------------
vim.opt.nu = true -- Enable line numbers
vim.opt.relativenumber = true -- Relative line numbers for quick jump

---------------------------------------------------------
-- Auto Formatting
---------------------------------------------------------
vim.g.autoformat = false -- Enable LazyVim auto formatting, <leader>cf to format file

---------------------------------------------------------
-- Snacks Animations
---------------------------------------------------------
vim.g.snacks_animate = true -- Enable animations globally

---------------------------------------------------------
-- Lualine
---------------------------------------------------------
vim.g.trouble_lualine = true -- Show current doc symbols location from Trouble in Lualine

---------------------------------------------------------
-- Netrw
---------------------------------------------------------
-- 0 = Thin. One file per line, names only
-- 1 = Long. One file per line with size, date, time
-- 2 = Wide. Multiple cols
-- 3 = Tree. File tree view
vim.g.netrw_liststyle = 0

---------------------------------------------------------
-- Other
---------------------------------------------------------
vim.opt.confirm = false -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Highlight current line
vim.opt.list = false -- Show invisible characters (eg. tabs)
vim.opt.winminwidth = 5 -- Minimum window width
