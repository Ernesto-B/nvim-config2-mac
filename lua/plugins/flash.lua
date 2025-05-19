-- ~/.config/nvim/lua/plugins/flash.lua
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,

    ---@type Flash.Config
    opts = {
        highlight = {
            -- don’t dim the rest of the window
            backdrop = false,


            -- for the very first keystroke label
            label_primary = { group = "FlashLabelPrimary" },

            -- highlight the whole match (if you use `label`-less modes)
            match = { group = "FlashMatch" },
        },
        -- for non-primary labels we want to use the FlashLabel group
        label = { group = "FlashLabel" },
    },

    config = function(_, opts)
        -- First install with our table‐shaped highlights
        require("flash").setup(opts)

        -- Now override the actual Vim highlight groups
        -- so they use whatever fg/bg you prefer:

        -- make the backdrop fully transparent (no dimming)
        vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "Normal" })

        -- primary label: white on red, bold
        vim.api.nvim_set_hl(0, "FlashLabelPrimary", {
            fg = "#ffffff",
            bg = "#ff5555",
            bold = true,
        })

        -- secondary labels: dark text on blue background
        vim.api.nvim_set_hl(0, "FlashLabel", {
            fg = "#282a36",
            bg = "#6272a4",
        })

        -- whole‐match highlight: subtle grey
        vim.api.nvim_set_hl(0, "FlashMatch", {
            bg = "#44475a",
        })
    end,

  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = "c", function() require("flash").toggle() vim.notify("Toggled flash search", vim.log.levels.WARN) end, desc = "Toggle Flash Search" },
  },
}
