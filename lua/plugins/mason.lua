-- Auto installation of Mason packages
return {
    -- Ensure all LSP servers are installed
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",      -- python (type checking)
                "ruff",         -- python (linting + code actions)
                "gopls",        -- go
                "jdtls",        -- java
                "bashls",       -- bash
                "jsonls",       -- json
                "yamlls",       -- yaml
                "eslint",       -- js/ts
                "clangd",       -- c/cpp
                "lua_ls",       -- lua (for nvim config editing)
                "terraformls",  -- terraform
                "dockerls",     -- dockerfile
                "sqlls",        -- sql
            },
        },
    },

    -- Ensure formatters & linters not covered by LSPs are installed via Mason
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "stylua",       -- lua formatter
                "shfmt",        -- bash formatter
                "prettier",     -- js/ts/json/md/yaml/css/html
                "yamlfmt",      -- yaml (alternative to prettier)
                "goimports",    -- go formatter + import organizer
                "gofumpt",      -- stricter go formatter
            })
        end,
    },
}
