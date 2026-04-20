-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

---------------------------------------------------------
-- File Names
---------------------------------------------------------
vim.opt.isfname:append("@-@") -- Treat @-@ as part of filenames in search
vim.opt.isfname:append(".")   -- Treat . as part of filenames in search

---------------------------------------------------------
-- Performance
---------------------------------------------------------
vim.opt.updatetime = 500 -- Time before CursorHold fires (default 4000); lower = more frequent LSP highlight, snacks.words, signature popups

---------------------------------------------------------
-- Colors
---------------------------------------------------------
vim.opt.colorcolumn = "80"   -- Vertical line at col=80
vim.opt.termguicolors = true -- True color support
-- Must be deferred: LazyVim re-enables hlsearch during plugin init (after this file runs)
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function() vim.opt.hlsearch = false end,
})

---------------------------------------------------------
-- Indentation (override LazyVim's default of 2)
---------------------------------------------------------
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

---------------------------------------------------------
-- Auto Formatting
---------------------------------------------------------
-- Toggles format-on-save (wired to conform.nvim in lua/plugins/conform.lua).
-- Flip to `true` for format-on-save by default, or use :FormatToggle / <leader>cf.
vim.g.autoformat = false

---------------------------------------------------------
-- Snacks Animations
---------------------------------------------------------
vim.g.snacks_animate = false

---------------------------------------------------------
-- Lualine
---------------------------------------------------------
vim.g.trouble_lualine = true -- Show current doc symbols location from Trouble in Lualine

---------------------------------------------------------
-- Netrw
---------------------------------------------------------
-- 0 = Thin, 1 = Long, 2 = Wide, 3 = Tree
vim.g.netrw_liststyle = 0

---------------------------------------------------------
-- UI Behavior
---------------------------------------------------------
vim.opt.showcmd = false -- Don't show partial commands (e.g. `m<letter>`) in statusline via noice

---------------------------------------------------------
-- Other
---------------------------------------------------------
vim.opt.confirm = false      -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true    -- Highlight current line
vim.opt.list = false         -- Show invisible characters (eg. tabs)
vim.opt.winminwidth = 5      -- Minimum window width
vim.opt.guicursor = "n-v-c-i:block"
