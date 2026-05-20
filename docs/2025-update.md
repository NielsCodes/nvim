# Neovim configuration update recommendations (2025)

Research conducted: October 2025

## Current state

Your configuration is solid and follows modern best practices with lazy.nvim, mason, and a well-organized plugin structure. You're already using several trending plugins like snacks.nvim, gitsigns, nvim-ufo, and conform.nvim.

## Key findings from community research

### Major ecosystem trends in 2025

1. **AI integration boom** - Heavy adoption of AI coding assistants (not needed - using Claude Code in tmux)
2. **Lua-first approach** - Complete migration away from VimScript to Lua
3. **Performance focus** - New plugins emphasize speed and minimal overhead
4. **Built-in feature improvements** - Neovim 0.11+ reduces need for some plugins
5. **Completion engine evolution** - New completion engines emerging as alternatives to nvim-cmp

### New LSP API (future consideration)

Neovim's master branch (not yet released) includes new `vim.lsp.config()` and `vim.lsp.enable()` functions that will simplify LSP setup:

- Less boilerplate than current nvim-lspconfig approach
- Separates configuration from enablement
- Global defaults via `vim.lsp.config('*', { root_markers = { '.git' }})`
- Not production-ready yet - requires Neovim 0.11.3+ when released

## Recommended plugins to consider

### High priority

1. **blink.cmp** (`saghen/blink.cmp`)
   - Modern, significantly faster completion engine to replace nvim-cmp
   - Native support for LSP, snippets, cmdline, and signature help
   - Major performance improvement over nvim-cmp
   - Growing rapidly in popularity

2. **lazydev.nvim** (`folke/lazydev.nvim`)
   - Optimized LuaLS setup specifically for Neovim config development
   - Faster autocomplete when editing your Neovim configuration
   - Replaces manual lua_ls configuration

3. **tiny-inline-diagnostic.nvim** (`rachartier/tiny-inline-diagnostic.nvim`)
   - Better inline diagnostic display (prettier than floating windows)
   - Shows diagnostics at cursor position with icons and colors
   - Alternative to your current `virtual_text = false` + float approach

### Medium priority

4. **symbol-usage.nvim** (`Wansmer/symbol-usage.nvim`)
   - Displays reference counts and implementations inline
   - Helps understand code usage without running LSP commands

5. **markview.nvim** (`OXY2DEV/markview.nvim`)
   - Markdown, Typst, LaTeX, HTML, and YAML previewer
   - Currently trending, hackable and extensible

### Trending but not essential for your workflow

- **avante.nvim** / **codecompanion.nvim** - AI assistants (not needed)
- **which-key.nvim** - Keybinding popup (not new, you don't want it)
- **dropbar.nvim** - IDE-like breadcrumbs (you don't care about it)
- **mini.indentscope** / **indent-blankline.nvim** - You already have indent solution

## Configuration improvements to consider

### 1. Simplify LSP configuration

Your `lsp-config.lua` has duplicate server setups. The mason-lspconfig handlers already configure servers, then you reconfigure them again. You can remove lines 104-167 since the handlers at lines 30-78 already set them up.

Exception: Keep custom configurations like svelte's `on_attach` for file watching.

### 2. Migrate away from none-ls

`none-ls.nvim` is deprecated (fork of the archived null-ls). Consider:

- Moving formatters to conform.nvim (you already use it)
- Moving linters to `mfussenegger/nvim-lint` if needed
- Check what you're using none-ls for and migrate gradually

### 3. Update diagnostic display strategy

Current approach: `virtual_text = false` with manual float opening (`<leader>f`)

Alternative: Try tiny-inline-diagnostic.nvim for automatic, prettier inline display at cursor position without cluttering the buffer.

## Most popular plugins in 2025 (reference)

According to dotfyle.com tracking 1000+ configs:

**Core infrastructure:**

- nvim-treesitter
- nvim-lspconfig
- lazy.nvim
- plenary.nvim
- telescope.nvim
- mason.nvim

**UI & UX:**

- lualine.nvim
- gitsigns.nvim
- nvim-web-devicons
- noice.nvim

**Completion & snippets:**

- nvim-cmp (or blink.cmp as newer alternative)
- LuaSnip
- friendly-snippets

**Utilities:**

- Comment.nvim
- nvim-autopairs
- conform.nvim
- trouble.nvim

You already have most of these.

## Best practices for 2025

1. **Keep it minimal** - Don't add plugins you don't need
2. **Leverage built-ins** - Neovim 0.11+ includes many features that previously required plugins
3. **Performance matters** - Profile your config if it feels slow
4. **Lua everywhere** - No VimScript (you're already doing this)
5. **Modular structure** - One plugin per file in `lua/plugins/` (you're already doing this)

## Next steps

1. Consider trying blink.cmp as a drop-in replacement for nvim-cmp (significant performance gain)
2. Add lazydev.nvim for better config editing experience
3. Review none-ls usage and plan migration
4. Clean up duplicate LSP server configurations
5. Optionally try tiny-inline-diagnostic.nvim for better diagnostic UX

## Resources

- Trending plugins: https://dotfyle.com/neovim/plugins/trending
- Awesome Neovim: https://github.com/rockerBOO/awesome-neovim
- New LSP API discussion: https://typecraft.dev/newsletters/2025-01-08/a-new-way-to-setup-lsps-has-been-merged
