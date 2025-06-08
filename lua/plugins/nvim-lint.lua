return {
    "mfussenegger/nvim-lint",
    opts = {
        -- when to trigger linting. Comment out to prevent auto linting
        -- events = { "BufWritePost", "BufReadPost", "InsertLeave" },

        linters_by_ft = {
            -- dotenv = { "dotenv-linter" }, -- .env files
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            vue = { "eslint_d" },
            python = { "flake8" },
            go = { "golangci-lint", "staticcheck" }, -- run both on Go
            sql = { "postgrestools" }, -- .sql files
            sh = { "shellcheck" },
            bash = { "shellcheck" },
            zsh = { "shellcheck" },
        },

        -- define any custom linters (only needed for ones nvim-lint doesn’t ship)
        linters = {},
    },

        -- Clear LazyVim's default autocmds on config load
        config = function(_, opts)
            require("lint").linters_by_ft = opts.linters_by_ft
            require("lint").linters = opts.linters or {}

            -- This is critical: remove all autocmds from the default LazyVim group
        vim.api.nvim_clear_autocmds({
            group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        })
        end,
}
