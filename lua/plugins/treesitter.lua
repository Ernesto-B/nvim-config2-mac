return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash", "c", "cmake", "cpp", "css", "csv",
                "dockerfile", "go", "gomod", "gosum", "gowork",
                "html", "java", "javascript", "json", "lua", "markdown",
                "proto", "python", "sql", "terraform", "typescript", "yaml",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]a"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[a"] = "@parameter.inner",
                    },
                },
            },
        })
        vim.treesitter.language.register("bash", "env")
    end,
}
