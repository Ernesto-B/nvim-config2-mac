-- Lualine inherits the active colorscheme automatically.
-- Use this file only to override sections, components, or icons.
return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- Component: show active LSP clients + conform formatters for the current buffer.
        local function lsp_and_formatter()
            local bufnr = vim.api.nvim_get_current_buf()
            local parts = {}

            local lsp_names = {}
            for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
                if client.name ~= "null-ls" and client.name ~= "copilot" then
                    table.insert(lsp_names, client.name)
                end
            end
            if #lsp_names > 0 then
                table.insert(parts, " " .. table.concat(lsp_names, ","))
            end

            local ok, conform = pcall(require, "conform")
            if ok then
                local fmt_names = {}
                for _, f in ipairs(conform.list_formatters(bufnr)) do
                    if f.available then table.insert(fmt_names, f.name) end
                end
                if #fmt_names > 0 then
                    table.insert(parts, "󰉼 " .. table.concat(fmt_names, ","))
                end
            end

            return table.concat(parts, " ")
        end

        opts.sections = opts.sections or {}
        opts.sections.lualine_x = opts.sections.lualine_x or {}
        table.insert(opts.sections.lualine_x, 1, {
            lsp_and_formatter,
            cond = function() return vim.bo.buftype == "" end,
        })
    end,
}
