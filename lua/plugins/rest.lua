-- UNTESTED
return {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "http", "rest" },
    config = function()
        require("rest-nvim").setup({
            result_split_horizontal = false,
            skip_ssl_verification = false,
            highlight = {
                enabled = true,
                timeout = 550,
            },
            jump_to_request = false,
            rocks = {
                enabled = false, -- disable luarocks support
                hererocks = true,
            },
        })

        vim.keymap.set("n", "<leader>rr", ":Rest run <cr>", { desc = "run http request" })
        vim.keymap.set("n", "<leader>ro", ":Rest open <cr>", { desc = "open results pane" })
    end,
}
