return {
  {
    "saghen/blink.cmp",
    opts = {
      -- ⚙️ Only define allowed config sections exactly
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

