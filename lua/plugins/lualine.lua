-- Lualine inherits the active colorscheme automatically.
-- Use this file only to override sections, components, or icons.
return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- Compute LSP + conform formatter names and cache on the buffer. This
        -- runs on buffer/LSP/filetype events rather than every statusline
        -- redraw — conform.list_formatters calls vim.fn.executable() per
        -- formatter, which is too expensive to run on each redraw.
        local function refresh_lsp_fmt_status(bufnr)
            bufnr = bufnr or vim.api.nvim_get_current_buf()
            if not vim.api.nvim_buf_is_valid(bufnr) then return end

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

            vim.b[bufnr].lsp_fmt_status = table.concat(parts, " ")
        end

        local group = vim.api.nvim_create_augroup("LualineLspFmtStatus", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType", "LspAttach", "LspDetach" }, {
            group = group,
            callback = function(args) refresh_lsp_fmt_status(args.buf) end,
        })

        opts.sections = opts.sections or {}
        opts.sections.lualine_x = opts.sections.lualine_x or {}
        table.insert(opts.sections.lualine_x, 1, {
            function() return vim.b.lsp_fmt_status or "" end,
            cond = function() return vim.bo.buftype == "" end,
        })

        -- Anchor filename right after the branch so its position doesn't
        -- shift with diagnostic counts. LazyVim's default lualine_c order is
        -- {root_dir, diagnostics, filetype_icon, pretty_path}; reshuffle to
        -- {filetype_icon, pretty_path, root_dir, diagnostics}.
        local c = opts.sections.lualine_c
        if c and #c >= 4 then
            opts.sections.lualine_c = { c[3], c[4], c[1], c[2] }
        end

        opts.sections.lualine_z = {
            function() return "\u{f017} " .. os.date("!%R") .. " UTC" end,
        }
    end,
}
