-- conform.nvim formatter spec.
-- LazyVim already wires format-on-save and the <leader>cf keymap to conform,
-- and gates them on `vim.g.autoformat` (set in lua/config/options.lua).
-- Toggle at runtime with `<leader>uf` (global) or `<leader>uF` (buffer).
return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python      = { "ruff_format" },
            go          = { "goimports", "gofumpt" },
            lua         = { "stylua" },
            sh          = { "shfmt" },
            bash        = { "shfmt" },
            terraform   = { "terraform_fmt" },
            hcl         = { "terraform_fmt" },
            yaml        = { "prettier" },
            json        = { "prettier" },
            jsonc       = { "prettier" },
            markdown    = { "prettier" },
            javascript  = { "prettier" },
            typescript  = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css         = { "prettier" },
            html        = { "prettier" },
        },
    },
}
