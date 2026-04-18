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

        -- Walk up the treesitter node tree from the cursor. If we hit an
        -- interpolation node first (Python f-string `{...}`, JS template `${...}`),
        -- allow completions. If we hit a string/comment first, suppress.
        local ok, node = pcall(vim.treesitter.get_node, {
          bufnr = 0,
          pos = { row, col },
          ignore_injections = false,
        })
        if ok and node then
          -- Cap the walk: strings/comments are always within ~3 ancestors of any
          -- inner token. Stops us from iterating up 20+ levels in deeply nested
          -- code (large files / nested classes/methods/loops).
          local in_string_or_comment = false
          local n = node
          for _ = 1, 4 do
            if not n then break end
            local t = n:type()
            if t == "interpolation"
              or t == "template_substitution"
              or t == "format_expression"
              or t == "string_interpolation"
            then
              return true
            end
            if t:find("comment") or t == "string" or t == "string_content" or t:find("string_literal") then
              in_string_or_comment = true
            end
            n = n:parent()
          end
          if in_string_or_comment then
            return false
          end
          return true
        end

        -- Fallback for buffers without treesitter
        local synline = cursor[1]
        local syncol = math.max(1, cursor[2])
        for _, id in ipairs(vim.fn.synstack(synline, syncol)) do
          local name = vim.fn.synIDattr(vim.fn.synIDtrans(id), "name")
          if name == "Comment" or name == "String" then
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

