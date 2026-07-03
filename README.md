# ObscuraVim Minimal

A single-file, zero-plugin config for machines where Neovim is ancient (or where you only have Vim). No plugin manager, no external dependencies — `rg` is optional and only used by `:Gs`.

Part of the [ObscuraVim](https://github.com/obscura-vim/obscura-vim) family. If your Neovim is 0.10+, use the full config instead.

## Install

```bash
curl -fsSL https://obscuravim.xyz/install.sh | sh
```

The installer detects your Neovim version and picks the right tier automatically.

Manual install:

```bash
# Neovim
curl -fsSL --create-dirs -o ~/.config/nvim/init.vim \
  https://raw.githubusercontent.com/obscura-vim/obscura-minimal/main/init.vim

# Vim
curl -fsSL -o ~/.vimrc \
  https://raw.githubusercontent.com/obscura-vim/obscura-minimal/main/init.vim
```

## What's inside

- Sane defaults: 4-space indent, smartcase search, wrap with `breakindent`, system clipboard, mouse.
- `netrw` as a file tree (`<C-e>`).
- Quickfix-based workflows, no fuzzy finder needed:
  - `:Gs <query>` / `<leader>w` — ripgrep into quickfix
  - `:Ff <query>` / `<leader>f` — find files into quickfix
  - `:ArcSt` / `<leader>s` — `arc st` into quickfix
- Tabs as workspaces: `<leader>1..9`, `<leader>0`, `<leader>h/l`, `,h`/`,l` to move tabs.
- Small comforts: `jk` to escape, `<Esc>` clears search highlight, trailing whitespace stripped on save, cursor restored to last position.

Works in any Neovim and in Vim 8+ (nvim-only options are guarded).
