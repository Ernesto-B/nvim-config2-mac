-- Example of how to change themes:
-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000, -- load early
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
                dim_inactive = false,
                terminal_colors = true,
                undercurl = true,
                underline = false,
                bold = true,
                italic = { strings = false, comments = false, emphasis = true, operators = false, folds = true },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                inverse = true, -- invert background for search, diffs, etc.
                contrast = "", -- can be "hard", "soft" or empty
                palette_overrides = {},
                overrides = {},
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
}
