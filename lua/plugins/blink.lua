return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        local disabled_filetypes = { "markdown", "text", "txt", "gitcommit", "norg", "json", "jsonc" }
        if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
          return false
        end

        local cursor = vim.api.nvim_win_get_cursor(0)
        local row = cursor[1] - 1
        local col = math.max(0, cursor[2] - 1)

        local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, row, col)
        if ok and captures then
          for _, c in ipairs(captures) do
            if c.capture == "comment" or vim.startswith(c.capture, "comment.") then
              return false
            end
          end
        end

        local synline = cursor[1]
        local syncol = math.max(1, cursor[2])
        for _, id in ipairs(vim.fn.synstack(synline, syncol)) do
          if vim.fn.synIDattr(vim.fn.synIDtrans(id), "name") == "Comment" then
            return false
          end
        end

        return true
      end,
      sources = {
        default = { "lsp", "path", "snippets" },
        compat = {},
      },
      cmdline = {
        enabled = false,        -- disable cmdline completions
        -- providers = {},
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        ghost_text = { enabled = true },
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          window = { border = "rounded" },
        },
      },
      signature = { enabled = false },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
      -- don't override fields like `providers`, `omni`, `mapping`, or `ui`
    },
  },
}

