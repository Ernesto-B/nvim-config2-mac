return {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local map = vim.keymap.set
        local o = { noremap = true, silent = true }

        -- Bottom terminal
        local th = Terminal:new({
            count = 1,
            direction = "horizontal",
            -- size = 15,
            open_mapping = false, -- we do our own mapping
        })
        -- Side terminal
        local tv1 = Terminal:new({
            count = 2,
            direction = "vertical",
            -- size = 60,
            open_mapping = false,
        })

        -- Bind Ctrl-` for bottom term
        map({ "n", "t" }, "<C-\\>", function()
            th:toggle(15)
        end, o)

        -- Ctrl-] for side term
        map({ "n", "t" }, "<C-]>", function()
            tv1:toggle(60)  -- Change the size of the side terminal here
        end, o)
    end,
}
