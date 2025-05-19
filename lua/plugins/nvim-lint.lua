return {
    "mfussenegger/nvim-lint",
    opts = {
        -- when to trigger linting
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },

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
}
