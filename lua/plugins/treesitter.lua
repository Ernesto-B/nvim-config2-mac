return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash", "c", "cmake", "cpp", "css", "csv",
                "dockerfile", "go", "gomod", "html", "java",
                "javascript", "json", "lua", "markdown",
                "python", "sql", "terraform", "typescript", "yaml",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
        vim.treesitter.language.register("bash", "env")
    end,
}
