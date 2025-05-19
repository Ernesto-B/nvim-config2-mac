return {
    "stevearc/conform.nvim",
    opts = function(_, opts)
        -- Add new formatters to this list so they run automatically on file save
        opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft, {
            -- lua = { "stylua" },    -- Already added
            -- fish = { "fish_indent" },  -- Already added
            -- sh = { "shfmt" },  -- Already added
            python = { "black" },
            angular = { "prettier" },
            css = { "prettier" },
            flow = { "prettier" },
            graphql = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            jsx = { "prettier" },
            less = { "prettier" },
            markdown = { "prettier" },
            scss = { "prettier" },
            typescript = { "prettier" },
            vue = { "prettier" },
            yaml = { "prettier" },
            go = { "gofumpt" },
            ruby = { "rubocop" },
        })
    end,
}
