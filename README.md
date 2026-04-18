# Nvim Config MK.2

- Refer to the [documentation](https://lazyvim.github.io/installation) to view base config and plugins
- [Original nvim-config2](https://github.com/Ernesto-B/nvim-config2)
- Other plugins installed:
  - [blink.cmp](https://github.com/Saghen/blink.nvim) — completion engine (LSP, path, snippets)
  - [cloak](https://github.com/laytan/cloak.nvim) — hide secrets in `.env` files
  - [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) — quick file marks
  - [incline](https://github.com/b0o/incline.nvim) — floating buffer name per window
  - [smear-cursor](https://github.com/sphamba/smear-cursor.nvim) — animated cursor motion
  - [conform.nvim](https://github.com/stevearc/conform.nvim) — formatter runner (format-on-save + manual)
  - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) — live markdown preview in browser

## Usage Tips:
- `<Tab>` Accept completion suggestion
- `<C-j>` / `<C-k>` Move down / up in completion list or menus
- `<C-x>` to remove file from list in a menu
- `<leader>db` - delete current buffer
- `<leader>,` - view all buffers
- View / search default nvim keymaps [here](https://vimdoc.sourceforge.net/htmldoc/vimindex.html)
- Refer to this config's custom [Keymaps Cheat Sheet](#keymaps-cheat-sheet)
- LSP servers: pyright (Python), ruff (Python linting + code actions), gopls (Go), bashls, jsonls, yamlls, eslint (JS/TS), clangd (C/C++), lua_ls, terraformls, dockerls, sqlls
- Pyright auto-detects `.venv/` or `venv/` in the project root for virtual environments

## Formatting (conform.nvim)
- Manual format: `<leader>cf` (LazyVim's built-in, normal + visual mode)
- Toggle format-on-save at runtime: `<leader>uf` (global) or `<leader>uF` (buffer-local)
- Default behavior set in `lua/config/options.lua` → `vim.g.autoformat` (default `false`; set to `true` to format on every save)
- Formatters configured per filetype in `lua/plugins/conform.lua`
- Formatters auto-installed via Mason (see `lua/plugins/mason.lua`); `terraform_fmt` uses the system `terraform` binary

## Keymaps Cheat Sheet
### Basics
- `D` Delete from cursor to end of line
- `C` Change from cursor to end of line
- `V` Select entire line (Visual Line)
- `{` / `}` Jump to previous / next function
- `dfx` Delete until (but not including) next `x`
- `cfx` Change until next `x`
- `fx` / `Fx` Jump to next / previous occurrence of `x`
- `ciw` / `diw` / `viw` Change / delete / select inner word
- `daw` Delete a word and surrounding whitespace
- `vis` / `dis` / `cis` Select / delete / change paragraph

### Splits & Navigation (smart-splits)
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` Move between nvim splits or tmux panes
- `<C-w>>` / `<C-w><` Resize split wider / narrower (vim built-in)
- `<C-w>+` / `<C-w>-` Resize split taller / shorter (vim built-in)
- `<C-w>=` Equalize all split sizes (vim built-in)

### Window & Buffers
- `<leader>pv` Open Netrw explorer
- `<leader>db` Delete current buffer
- `<leader>,` List all buffers
- `<C-t>` Toggle focusing terminal and editor
- `<C-q>` Close the terminal window
- `<C-x>` Exit terminal insert mode to normal mode

### Movement & Display
- `<C-d>` / `<C-u>` Half-page down / up + center cursor
- `n` / `N` Next / previous search + center/fold open
- `za` / `zi` Toggle current fold / all folds
- `<leader>uS` Toggle smooth scroll
- `<leader>uw` Toggle line wrap (LazyVim default)
- `<leader>uz` Toggle Zen mode _(requires zen-mode LazyVim extra)_
- `<leader>uD` Toggle dim background _(requires twilight LazyVim extra — not installed)_
- `<leader>tb` Toggle window transparency
- `<leader>uc` Toggle conceal level
- `<leader>uC` Cycle through color schemes
- `<leader>uh` Toggle LSP inlay hints
- `<leader>cs` Display all symbols in file

### Search & Navigation
- `<leader><Space>` _Intentionally left unbound_ — reserved as an open slot for a future high-frequency action (LazyVim's default "Find Files (Root Dir)" is explicitly cleared in `lua/config/keymaps.lua`)
- `<leader>pf` Find file from current working directory by name (includes hidden, excludes gitignored)
- `<leader>ff` Find file from project root (LazyVim default — walks up to LSP root / `.git`)
- `<leader>sg` Live grep in project
- `s` Flash jump — type 2 chars of destination, pick label, teleport
- `S` Flash treesitter — select by AST node
- `<C-s>` In-file replace current word — opens `:%s/<word>/<word>/gI` pre-filled, move cursor left 3× to edit replacement
- `<leader>s` _(visual)_ In-file replace selection — wraps selection into `:%s/\V<selection>//gI` pre-filled
- `<leader>sr` Grug-far — multi-file search & replace with live preview
- `<leader>ss` List functions/classes in file to jump to
- `<leader>sw` Search for current symbol in workspace
- `gr` LSP: find references across workspace
- `gd` LSP: go to definition
- `<leader>ca` LSP: code actions (imports, fixes, refactors)
- `<leader>cf` Format buffer or visual selection (conform.nvim, LSP fallback)
- `<leader>uf` / `<leader>uF` Toggle format-on-save (global / buffer)
- `<leader>cp` Toggle markdown preview in browser (markdown filetype)
- `g;` / `g,` Jump to prev / next edit position
- `<leader>fp` Browse projects
- `<leader>fR` Browse recent files (project)
- `<leader>fe` Toggle file-explorer (project root)
- `<leader>fE` Toggle file-explorer (pwd)

### Git
- `<leader>gg` Open lazygit (root dir)
- `<leader>gs` Git status
- `<leader>gf` Git file history
- `<leader>gl` Git log
- `<leader>gL` Git log (cwd)
- `<leader>gb` Git blame (line)
- `<leader>gY` Copy GitHub URL of file/line

### Advanced Editing
- `J` / `K` in Visual — Move selected lines down / up
- `=ap` Auto-indent current paragraph
- `gUaw` Capitalize entire word
- `<leader>d` Delete into black-hole register
- `]a` Go to next function parameter start
- `]m` Go to next function
- `<leader>cr` Rename current file (Snacks input box — also notifies LSP to update imports)
- `vis` Select entire paragraph
- `<leader>nf` Create new file at directory

### Commenting & Diagnostics
- `[d` / `]d` Prev / next diagnostic
- `gcc` Toggle comment (line)
- `gco` / `gcO` Add comment below / above
- `K` Hover documentation / LSP signature (bordered popup via noice)
- `<C-d>` (insert mode) Toggle docs — blink completion docs or noice signature popup

### Spelling
- `<leader>us` Toggle spell check in current buffer
- `]s` / `[s` Jump to next / previous spelling error
- `z=` Show spelling suggestion correction to pick

### Harpoon
- `<leader>a` Add file to Harpoon
- `<leader>A` Open Harpoon quick-menu (Telescope UI)
- `<leader>[` / `<leader>]` Cycle Harpoon marks
- `<leader>1` … `<leader>5` Jump to Harpoon slot 1–5
- `<leader>r` Remove current file from Harpoon
- `<leader>C` Clear all Harpoon marks

### Useful Commands
- `<leader>sC` Search commands
- `:TSInstall`, `:TSUninstall`, `:TSUpdate` Treesitter
- `:Lazy sync [plugin]`, `:Lazy clean [plugin]` LazyVim
- `:Mason` Open Mason UI
- `:LspInfo` Show LSP status
- `:help <topic>` Read built-in docs
- `:verbose [mode]map [keymapping]` Check keymapping for provided mode/input
- `<leader>sk` View and search keymaps

## Tmux Keymaps
https://tmuxcheatsheet.com/
