# Nvim Config MK.2

- Refer to the [documentation](https://lazyvim.github.io/installation) to view base config and plugins
- Other plugins installed:
  - [blink](https://github.com/Saghen/blink.nvim)
  - [cloak](https://github.com/laytan/cloak.nvim)
  - [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
  - [incline](https://github.com/b0o/incline.nvim)
  - [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
  - [rest-nvim](https://github.com/rest-nvim/rest.nvim)
  - [smart-splits](https://github.com/mrjones2014/smart-splits.nvim)
  - [smear-cursor](https://github.com/sphamba/smear-cursor.nvim)
  - [toggleterm](https://github.com/akinsho/toggleterm.nvim)
  - [wakatime](https://wakatime.com/neovim)

## Usage Tips:
- `<C-j>` or `k` to move up and down menus (like harpoon list)
- `<C-x>` to remove file form list in a menu
- `<leader>db` - delete current buffer
- `<leader>,` - view all buffers
- View / search default nvim keymaps [here](https://vimdoc.sourceforge.net/htmldoc/vimindex.html)
- Refer to this config's custom [Keymaps Cheat Sheet](#keymaps-cheat-sheet)

## Fix for ".so is not a valid Win32 application"
1. Check installation of "clang-cl" `:!where clang-cl`. If you get an error, you have to first install "clang-cl" via the Visual Studio Installer
2. In the treesitter config, set the compiler as "clang-cl": `require 'nvim-treesitter.install'.compilers = { "clang-cl" }`. This should be right below your `require("nvim-treesitter.configs").setup({` and before `ensure_installed = {...}`
3. Open the "x64 native tools command prompt for vs 2022" (requires having installed VS 2022 with dev tools. Can also install this via the Visual Studio installer)
4. Open nvim in the x64 cmd prompt terminal, `:TSUninstall` all the languages you were having trouble with, and then `:TSInstall` them back
5. Check installation of languages with `:TSInstallInfo`

## Keymaps Cheat Sheet
### Basics
- `D` Delete from cursor to end of line  
- `C` Change from cursor to end of line  
- `V` Select entire line (Visual Line)  
- `{` / `}` Jump to previous / next function  
- `dfx` Delete until (but not including) next `x`  
- `cfx` Change until next `x`  
- `fx` / `Fx` Jump to next / previous occurrence of `x`  
- `ciw` / `diw` / `viw` Change / delete / select inner word  
- `daw` Delete a word and surrounding whitespace  
- `vis` / `dis` / `cis` Select / delete / change paragraph  
- `<C-q>` Enter Visual-Block mode  

### Window & Buffers
- `<leader>pv` Open Netrw explorer  
- `<leader>db` Delete current buffer  
- `<leader>,` List all buffers  
- `<C-\>` or `<leader>ft` Toggle built-in terminal  
- `<C-x>`  Exit terminal mode to normal mode
- `<C-w>v` (while in terminal buf) Make new terminal buf split vertically

### Movement & Display
- `<C-d>` / `<C-u>` Half-page down / up + center cursor  
- `n` / `N` Next / previous search + center/fold open  
- `za` / `zi` Toggle current fold / all folds  
- `<leader>uS` Toggle smooth scroll  
- `<leader>uz` Toggle Zen mode  
- `<leader>uD` Toggle dim background  
- `<leader>tb` Toggle window transparency
- `<leader>uc` Toggle conceal level
- `<leader>uC` Cycle through color schemes  
- `<leader>uh` Toggle LSP inlay hints  
- `<leader>cs` Display all symbols in file

### Search & Navigation
- `<leader><Space>` Find file (Telescope)  
- `<leader>sg` Live grep in project  
- `<leader>sr` Grug-far (advanced search and replace in multiple files)
- `<C-s>` Simple search & replace current word in file
- `<M-s>` Simple search & replace current word in line
- `<leader>s` Search & replace selection in file
- `<C-s>` in search mode. Activate flash search
- `s` Flash search file
- `<leader>ss` List functions in file (Telescope symbols)  
- `<leader>sw` Search for symbol in workspace  
- `gr` LSP: find references  
- `gd` LSP: go to definition  
- `g;` / `g,` Jump to prev / next edit position  
- `<leader>fp` Browse projects  
- `<leader>fR` Browse recent files (project)  
- `<leader>fe` Toggle file-explorer (project root)  
- `<leader>fE` Toggle file-explorer (pwd)  

### Git
- `<leader>gg` Open lazygit (root dir)  
- `<leader>gs` Git status (Telescope)  
- `<leader>gf` Git file history (Telescope)  
- `<leader>gl` Git log (Telescope)  
- `<leader>gL` Git log (cwd)  
- `<leader>gb` Git blame (line)  
- `<leader>gY` Copy GitHub URL of file/line  

### Advanced Editing
- `J` / `K` in Visual Move selected lines down / up  
- `=ap` Auto-indent current paragraph  
- `gUaw` Capitalize entire word  
- `<leader>d` Delete into black-hole register  
- `]a` Go to next function parameter start  
- `]m` Go to next function  
- `<leader>cR` Rename current file
- `vis` Select entire paragraph
- `<leader>nf`  Create new file at directory

### Formatting & Linting
- `<leader>cf` Format buffer (force)  
- `<leader>cF` Format injected languages  
- `<leader>uf` Toggle auto-format (current buffer)  
- `<leader>uF` Toggle auto-format (all buffers)  
- `<leader>uN` Disable lint (all buffers). Restart nvim to re-enable

### Testing / Debugging / Commenting
- `<leader>rr` Run HTTP request (rest-nvim)  
- `<leader>ro` Open HTTP request results (rest-nvim) 
- `[d` / `]d` Prev / next diagnostic  
- `gcc` Toggle comment (line)  
- `gco` / `gcO` Add comment below / above  
- `K` Hover documentation (or LSP signature)  
- `<leader>cn` Generate annotation (neogen)  

### Spelling
- `<leader>us` Toggle spell check in current buffer
- `]s` / `[s` Jump to next / previous spelling error
- `z=` Show spelling suggestion correction to pick

### Harpoon
- `<leader>a` Add file to Harpoon  
- `<leader>A` Open Harpoon quick-menu (Telescope)  
- `<leader>[` / `<leader>]` Cycle Harpoon marks  
- `<leader>1` … `<leader>5` Jump to Harpoon slot 1–5  
- `<leader>r` Remove current file from Harpoon  
- `<leader>C` Clear all Harpoon marks  

### Useful Commands
- `<leader>sC` Search commands
- `:TSInstall`, `:TSUninstall`, `:TSUpdate` Treesitter  
- `:Lazy sync [plugin]`, `:Lazy clean [plugin]` LazyVim  
- `:Mason` Open Mason UI  
- `:ConformInfo` Show active formatters  
- `:LspInfo` Show LSP status  
- `:help <topic>` Read built-in docs  
- `:verbose [mode]map [keymapping]` Check keymapping for provided mode/input
- `<leader>sk` View and search keymaps
- `:MarkdownPreview` Open md file in browser
- `:Screenkey` Toggle Screenkey plugin
