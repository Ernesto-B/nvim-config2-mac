-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- NOTE, leader = <Space>
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Toggle docs: blink completion docs when menu is open, noice signature popup otherwise
keymap.set("i", "<C-d>", function()
    local ok, blink = pcall(require, "blink.cmp")
    if ok and blink.is_visible and blink.is_visible() then
        if blink.is_documentation_visible and blink.is_documentation_visible() then
            blink.hide_documentation()
        else
            blink.show_documentation()
        end
    else
        -- Only count focusable floats — incline.nvim uses focusable=false and would
        -- always make has_float true, blocking the re-show branch
        local has_noice_float = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local cfg = vim.api.nvim_win_get_config(win)
            if cfg.relative ~= "" and cfg.focusable ~= false then
                has_noice_float = true
                break
            end
        end
        if has_noice_float then
            require("noice").cmd("dismiss")
        else
            vim.schedule(function()
                vim.lsp.buf.signature_help()
            end)
        end
    end
end, { desc = "Toggle docs (blink or noice)", noremap = true, silent = true })

-- Terminal pane management:
--   <C-t>  from editor  → open terminal (if not open) or jump to it
--   <C-t>  from terminal → jump back to editor (terminal stays open)
--   <C-q>  from anywhere → close the terminal window

local function find_terminal_win()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].buftype == "terminal" then
            return win
        end
    end
end

keymap.set("n", "<C-t>", function()
    if vim.bo.buftype == "terminal" then
        vim.cmd("wincmd p")
    else
        local term_win = find_terminal_win()
        if term_win then
            vim.api.nvim_set_current_win(term_win)
            vim.cmd("startinsert")
        else
            Snacks.terminal.toggle(nil, {
                cwd = vim.fn.expand("%:p:h"),
                win = { position = "bottom", height = 0.3 },
            })
        end
    end
end, { desc = "Focus/open terminal" })

-- From terminal insert mode: return to editor without closing
keymap.set("t", "<C-t>", "<C-\\><C-n><C-w>p", { desc = "Return to editor from terminal", noremap = true })

-- Close the terminal window from anywhere
keymap.set("n", "<C-q>", function()
    local term_win = find_terminal_win()
    if term_win then
        vim.api.nvim_win_close(term_win, true)
    end
end, { desc = "Close terminal window" })
keymap.set("t", "<C-q>", "<C-\\><C-n><cmd>lua vim.api.nvim_win_close(0, true)<CR>",
    { desc = "Close terminal window", noremap = true })

-- Netrw
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- File picker scoped to the current working directory.
vim.keymap.set("n", "<leader>pf", function()
    LazyVim.pick("files", { cwd = vim.fn.getcwd() })()
end, { desc = "Find files from cwd" })

-- <leader><Space> is intentionally unbound. LazyVim assigns it to "Find Files
-- (Root Dir)" by default; we clear that here so the slot stays free for a
-- future high-frequency action. See README.
pcall(vim.keymap.del, "n", "<leader><Space>")

-- Moving selected lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z", { desc = "Cursor stays in place when merging lines" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down while keeping cursor in place" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up while keeping cursor in place" })
keymap.set("n", "n", "nzzzv", { desc = "Jump to next search result centered and opening folds" })
keymap.set("n", "N", "Nzzzv", { desc = "Jump to next search result centered and opening folds" })
keymap.set("n", "=ap", "ma=ap'a", { desc = "Auto indent paragraph" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selected text to + buffer (clipboard)" })

-- Override LazyVim's <leader>gY to notify on success. The default sets notify=false
-- and uses a custom `open` that silently copies, so there's no user feedback.
keymap.set({ "n", "x" }, "<leader>gY", function()
    Snacks.gitbrowse({
        open = function(url)
            vim.fn.setreg("+", url)
            vim.notify("Copied GitHub URL: " .. url, vim.log.levels.INFO, { title = "Git Browse" })
        end,
        notify = false,
    })
end, { desc = "Git Browse (copy URL + notify)" })

-- Document symbols picker. Normally provided by LazyVim's snacks_picker extra,
-- which isn't enabled in lazyvim.json — wire it up manually.
keymap.set("n", "<leader>ss", function()
    Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter })
end, { desc = "LSP Symbols (document)" })

keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape everything with <C-c>" })


---------------------------------------------------------
-- FIND AND REPLACE
---------------------------------------------------------
-- Normal: replace the word under cursor. Visual: replace the selection.
keymap.set(
    "n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace current word in file" }
)
keymap.set(
    "v", "<C-s>", [["zy:%s/\V<C-r>z//gI<Left><Left><Left>]],
    { desc = "Replace visual selection in file", silent = false }
)

-- Grug-far pre-filled with <cword> + --word-regexp for whole-word matches
-- across the workspace. Ripgrep-powered preview UI.
keymap.set("n", "<leader>sR", function()
    require("grug-far").open({
        prefills = {
            search = vim.fn.expand("<cword>"),
            flags = "--word-regexp",
        },
    })
end, { desc = "Grug-far: replace current word (workspace, word-boundary)" })

-- LSP-aware rename of the symbol under cursor across the workspace.
keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "LSP rename symbol (workspace)" })
---------------------------------------------------------

keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to black hole register to not replace last yank" })

-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "go to next location‐list item, then center screen" })
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "go to prev location‐list item, then center screen" })

-- Toggle transparency
local current = true
keymap.set("n", "<leader>tb", function()
    current = not current
    require("gruvbox").setup({ transparent_mode = current })
    vim.cmd("colorscheme gruvbox")
end, { desc = "Toggle Gruvbox transparency" })

-- keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
-- keymap.set("n", "ss", ":split<CR>", { desc = "Split current window horizontally" })

-- Remove LazyVim's default floating terminal binding
pcall(vim.keymap.del, "n", [[<C-\>]])
pcall(vim.keymap.del, "t", [[<C-\>]])

-- In terminal mode, pressing <C-x> will exit terminal mode (to normal)
keymap.set("t", "<C-x>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Pressing ! will begin a command
keymap.set("n", "!", ":!")

-- Hide line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function(args)
        local winid = vim.fn.bufwinid(args.buf)
        if winid == -1 then return end
        vim.wo[winid].number = false
        vim.wo[winid].relativenumber = false
    end,
})


-- Create or open a file anywhere
keymap.set("n", "<leader>nf", function()
    vim.ui.input({
        prompt     = "New file path: ",
        default    = "",
        completion = "file",
    }, function(path)
            if path and path ~= "" then
                vim.cmd("edit " .. vim.fn.fnameescape(path))
            end
        end)
end, { desc = "New file anywhere (with Tab completion)" })


-- Save file, just like :w
vim.api.nvim_create_user_command("W", "write", {})

