-- After pyright attaches, push the venv python path directly to the running process.
-- This fires after LazyVim finishes merging all settings, so it cannot be overwritten.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or client.name ~= "pyright" then return end

        local root = client.root_dir or vim.fn.getcwd()
        local candidates = {
            root .. "/venv/bin/python",
            root .. "/.venv/bin/python",
        }
        for _, python in ipairs(candidates) do
            if vim.fn.executable(python) == 1 then
                local new_settings = vim.tbl_deep_extend("force",
                    client.config.settings or {},
                    {
                        python = {
                            pythonPath = python,
                            defaultInterpreterPath = python,
                        },
                    }
                )
                client.config.settings = new_settings
                client.notify("workspace/didChangeConfiguration", { settings = new_settings })
                break
            end
        end
    end,
})

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- Keymaps under servers['*'] apply to every LSP attach.
                -- This is LazyVim's supported override path: user keys
                -- merge with defaults and win conflicts for the same lhs.
                ["*"] = {
                    keys = {
                        {
                            "<leader>cr",
                            function() Snacks.rename.rename_file() end,
                            desc = "Rename current file",
                        },
                    },
                },
                ruff = {
                    on_attach = function(client)
                        client.server_capabilities.hoverProvider = false
                        client.server_capabilities.documentFormattingProvider = false
                    end,
                },
            },
        },
    },
}
