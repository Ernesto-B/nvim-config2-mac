-- return {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     build = "cd app && npm install && git restore .",
--     -- or if you use yarn: (I have not checked this, I use npm)
--     -- build = "cd app && yarn install && git restore .",
--     init = function()
--         vim.g.mkdp_filetypes = { "markdown" }
--     end,
--     ft = { "markdown" },
-- }

return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]() -- This is the reliable build step
    end,
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        vim.g.mkdp_command_for_global = 0
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_theme = "dark"
    end,
}
