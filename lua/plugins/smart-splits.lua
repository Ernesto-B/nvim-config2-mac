return {
    "mrjones2014/smart-splits.nvim",
    keys = {
        -- Move between splits (nvim + tmux aware)
        { "<C-h>", function() require("smart-splits").move_cursor_left() end,  desc = "Move to left split" },
        { "<C-j>", function() require("smart-splits").move_cursor_down() end,  desc = "Move to lower split" },
        { "<C-k>", function() require("smart-splits").move_cursor_up() end,    desc = "Move to upper split" },
        { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
        -- For resizing splits, use the built-in vim bindings: <C-w>>, <C-w><, <C-w>+, <C-w>-
    },
}
