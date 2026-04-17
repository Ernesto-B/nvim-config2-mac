return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("cache") .. "/treesitter_parsers",
        })

        vim.treesitter.language.register("bash", "env")

        require("nvim-treesitter.install").install({
            "bash", "c", "cmake", "cpp", "css", "csv",
            "dockerfile", "go", "gomod", "html", "java",
            "javascript", "json", "lua", "markdown",
            "python", "sql", "terraform", "typescript", "yaml",
        })

        -- Enable treesitter highlighting and indent per filetype
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local ok = pcall(vim.treesitter.start)
                if ok then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
