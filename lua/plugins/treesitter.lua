return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        --Install into a user‐writable cache folder
        local cache_dir = vim.fn.stdpath("cache") .. "/treesitter_parsers"
        require("nvim-treesitter.install").parser_install_dir = cache_dir

        -- This compiler part is probably not required for linux configs
        require("nvim-treesitter.install").compilers = { "gcc" }
        -- require'nvim-treesitter.install'.compilers = { "zig cc", "clang-cl", "gcc" }

        -- map the "env" filetype to the "bash" parser:
        vim.treesitter.language.register("bash", { "env" })

        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc",
                "javascript",
                "typescript",
                "c",
                "lua",
                "rust",
                "jsdoc",
                "bash",
                "markdown",
                "markdown_inline",
                "python",
                "json",
                "cmake",
                "sql",
                "dockerfile",
                "go",
                "http",
                "yaml",
                "java",
                "terraform",
                "css",
                "php",
                "csv",
                "gomod",
                "graphql",
                "html",
                "nginx",
                "cpp",
                "ruby",
            },
            modules = {},
            ignore_install = {},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = false,

            indent = {
                enable = true,
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
            },
        })

        -- -- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        -- -- treesitter_parser_config.templ = {
        -- --     install_info = {
        -- --         url = "https://github.com/vrischmann/tree-sitter-templ.git",
        -- --         files = {"src/parser.c", "src/scanner.c"},
        -- --         branch = "master",
        -- --     },
        -- -- }
    end,
}
