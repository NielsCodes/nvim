# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

This is a Neovim configuration using lazy.nvim as the plugin manager. The configuration is modular with plugins organized in separate files under `lua/plugins/`.

## Key mappings

- Leader key: `<space>`
- Local leader: `\`
- Common mappings:
  - `jj` or `jk`: Escape insert mode
  - `<C-s>`: Save file
  - `<leader>x`: Close buffer
  - `<C-n>`: Toggle Neo-tree file explorer
  - `<leader>ff`: Find files with Telescope
  - `<leader>fw`: Live grep with Telescope
  - `K`: LSP hover
  - `gd`: Go to definition
  - `<leader>ca`: Code action
  - `<leader>xx`: Toggle trouble diagnostics

## Architecture

The configuration follows this structure:
- `init.lua`: Main entry point, basic settings and keymaps
- `lua/config/lazy.lua`: Lazy.nvim bootstrap and setup
- `lua/config/window-management.lua`: Custom window management functions
- `lua/plugins/`: Individual plugin configurations (one file per plugin/feature)

## Plugin management

Plugins are managed via lazy.nvim and defined in individual files under `lua/plugins/`. Each file returns a table with plugin specifications. Lazy.nvim automatically loads all plugin files from this directory.

## LSP configuration

LSP servers are managed through Mason and Mason-lspconfig. The following servers are automatically installed:
- lua_ls, gopls, ts_ls, eslint, html, cssls, svelte, sqlls, prismals, pyright, helm_ls, yamlls

Special configurations:
- yamlls is prevented from attaching to helm files (handled by helm_ls instead)
- Svelte LSP includes file watcher for JS/TS changes in lib directories

## Formatting

Auto-formatting on save is configured via conform.nvim:
- Lua: stylua
- JavaScript/TypeScript/React: prettierd
- Svelte: prettierd + rustywind
- Terraform: terraform_fmt
- YAML: prettier

## File search configuration

Telescope is configured to ignore common build artifacts and lock files:
- Excluded: .git, node_modules, .svelte-kit, .terraform, build, dist, coverage
- Lock files: pnpm-lock.yaml, package-lock.json, yarn.lock

## Treesitter languages

Automatically installed: go, typescript, javascript, svelte, lua, markdown, yaml, css, sql, prisma, html

## Custom file associations

- `.mjml` files are treated as HTML
- `.sqlx` files are treated as SQL