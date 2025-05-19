return {
    "mrjones2014/smart-splits.nvim",
    config = function()
        require("smart-splits").setup({
            -- you can pass any custom settings here. the defaults work well in most cases.
        })
        -- example keybindings:
        local opts = { noremap = true, silent = true }
        -- use alt+h/j/k/l to resize splits
        vim.keymap.set("n", "<a-h>", require("smart-splits").resize_left)
        vim.keymap.set("n", "<a-j>", require("smart-splits").resize_down)
        vim.keymap.set("n", "<a-k>", require("smart-splits").resize_up)
        vim.keymap.set("n", "<a-l>", require("smart-splits").resize_right)
        -- moving between splits
        -- vim.keymap.set("n", "<c-h>", require("smart-splits").move_cursor_left)
        -- vim.keymap.set("n", "<c-j>", require("smart-splits").move_cursor_down)
        -- vim.keymap.set("n", "<c-k>", require("smart-splits").move_cursor_up)
        -- vim.keymap.set("n", "<c-l>", require("smart-splits").move_cursor_right)
        -- vim.keymap.set("n", "<c-\\>", require("smart-splits").move_cursor_previous)
    end,
}
