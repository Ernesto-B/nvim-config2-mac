return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- for AST-powered introspection
        "L3MON4D3/LuaSnip",
    },
    -- load on demand when you hit your keybinding
    cmd = "Neogen",
    keys = {
        {
            "<leader>cn",
            function()
                require("neogen").generate()
            end,
            desc = "📝 Neogen: generate documentation",
        },
    },
    config = function()
        require("neogen").setup({
            -- pick your snippet engine: "luasnip", "vsnip", "snippy", etc.
            snippet_engine = "luasnip",

            -- automatically insert your cursor inside the docblock after generating
            input_after_comment = true,

            -- per-language annotation conventions. 
            -- View the repo readme to see all languages and their supported annotation conventions
            languages = {
                lua = {
                    template = {
                        annotation_convention = "ldoc",
                    },
                },
                python = {
                    template = {
                        annotation_convention = "google_docstrings",
                    },
                },
                javascript = {
                    template = {
                        annotation_convention = "jsdoc",
                    },
                },
                typescript = {
                    template = {
                        annotation_convention = "tsdoc",
                    },
                },
                go = {
                    template = {
                        annotation_convention = "godoc",
                    }
                }
                -- add more here
            },
        })
    end,
}
