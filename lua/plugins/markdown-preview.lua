-- Live markdown preview in the browser.
-- Usage: :MarkdownPreview, :MarkdownPreviewStop, :MarkdownPreviewToggle
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    keys = {
        { "<leader>cp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview", ft = "markdown" },
    },
}
