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
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
      },
      keymap = {
        preset = "enter",       -- VSCode style enter behavior
      },
      -- don't override fields like `providers`, `omni`, `mapping`, or `ui`
    },
  },
}

