-- ~/.config/nvim/lua/plugins/screenkey.lua
return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    opts = {
        -- Floating window options
        win_opts = {
            row = vim.o.lines - vim.o.cmdheight - 1,
            col = vim.o.columns - 1,
            relative = "editor",
            anchor = "SE",
            width = 20,
            height = 1,
            border = "rounded", -- border: "none","single","double","rounded","solid","shadow"
            title = "Screenkey",
            title_pos = "center",
            style = "minimal",
            focusable = false,
            noautocmd = true,
        },

        -- How many seconds to compress repeated keys
        compress_after = 3,
        -- How many seconds to clear the display
        clear_after = 3,

        -- Show `<leader>` in the displayed keys
        show_leader = true,
        -- Group multi-key mappings (if you want)
        group_mappings = true,

        -- Disable in these file/buffer types
        disable = {
            filetypes = { "env", "toggleterm", "toml" },
            buftypes = {},
        },

        -- Filter callback (return the keys you want shown)
        filter = function(keys)
            return keys
        end,

        -- Custom key symbols
        keys = {
            ["<TAB>"] = "󰌒",
            ["<CR>"] = "󰌑",
            ["<ESC>"] = "Esc",
            ["<SPACE>"] = "␣",
            ["<BS>"] = "󰌥",
            ["<DEL>"] = "Del",
            ["<LEFT>"] = "",
            ["<RIGHT>"] = "",
            ["<UP>"] = "",
            ["<DOWN>"] = "",
            ["<HOME>"] = "Home",
            ["<END>"] = "End",
            ["<PAGEUP>"] = "PgUp",
            ["<PAGEDOWN>"] = "PgDn",
            ["<INSERT>"] = "Ins",
            ["<F1>"] = "󱊫",
            ["<F2>"] = "󱊬",
            ["<F3>"] = "󱊭",
            ["<F4>"] = "󱊮",
            ["<F5>"] = "󱊯",
            ["<F6>"] = "󱊰",
            ["<F7>"] = "󱊱",
            ["<F8>"] = "󱊲",
            ["<F9>"] = "󱊳",
            ["<F10>"] = "󱊴",
            ["<F11>"] = "󱊵",
            ["<F12>"] = "󱊶",
            ["CTRL"] = "Ctrl",
            ["ALT"] = "Alt",
            ["SUPER"] = "󰘳",
            ["<leader>"] = "<leader>",
        },
    },
}
