-- ~/.config/nvim/lua/plugins/incline.lua
return {
    "b0o/incline.nvim",
    event = "VeryLazy",
    dependencies = { "ellisonleao/gruvbox.nvim" },
    config = function()
        -- 1) Make sure gruvbox is loaded so .palette() is populated
        vim.cmd([[colorscheme gruvbox]])

        local gruvbox = require("gruvbox")
        -- 2) Grab the active palette (must call it as a function)
        local palette = gruvbox.palette
        -- pick a background—you can choose dark0_hard, dark0_soft, etc.
        local bg = palette.dark0_hard or palette.dark0

        local helpers = require("incline.helpers")
        local devicons = require("nvim-web-devicons")

        require("incline").setup({
            window = {
                padding = { left = 0, right = 2 }, -- position in relation to top right of window
                margin = { horizontal = 0 },
            },
            hide = {
                cursorline = false,
                focused_win = false,
                only_win = true,
            },
            highlight = {
                groups = {
                    InclineNormal = { default = true, group = "NormalFloat" },
                    InclineNormalNC = { default = true, group = "NormalFloat" },
                },
            },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                if filename == "" then
                    filename = "[No Name]"
                end

                local icon, icon_color = devicons.get_icon_color(filename)
                local modified = vim.bo[props.buf].modified and " +" or "" -- What icon shows beside file name when modified

                local parts = {}
                if icon then
                    table.insert(
                        parts,
                        { " " .. icon .. " ", guibg = icon_color, guifg = helpers.contrast_color(icon_color) }
                    )
                end
                table.insert(parts, { filename .. modified, gui = "bold" })

                -- finally apply whatever bg your colorscheme uses
                return vim.tbl_extend("force", parts, { guibg = bg })
            end,
        })
    end,
}
