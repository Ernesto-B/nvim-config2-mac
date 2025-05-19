-- Auto installation of Mason packages
return {
    -- Ensure all LSP servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            -- List every LSP server you use
            ensure_installed = {
                "bashls", -- bash
                "jsonls", -- json
                "eslint", -- js/ts
                "pyright", -- python
                "gopls", -- go
                "html", -- html
                "cssls", -- css
                "tailwindcss", -- tailwindcss
                "lua_ls", -- lua
                "rust_analyzer", -- rust
                "clangd",   -- c/cpp
                "rubocop",   -- ruby
                -- Add more here
            },
        },
    },

    -- Use mason-null-ls to install formatters & linters
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            "williamboman/mason.nvim",
        },
        ft = { "*" }, -- load for all filetypes
        opts = {
            -- list all formatters & linters you want
            ensure_installed = {
                "black", -- python
                "flake8", -- python linter
                "prettier", -- js/css/html/markdown
                "eslint_d", -- js/ts linter
                "shellcheck", -- shell scripts
                "golangci-lint", -- go linter
                "gofumpt",  -- go formatter
                "staticcheck", -- go static analysis
                "dotenv-linter", -- .env files
                "postgrestools", -- your custom tool
                -- Add more here
            },
            automatic_installation = true, -- install/update on startup
        },
    },
}
