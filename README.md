# xcode-default.nvim

Neovim colorschemes ported from [smockle/xcode-default-theme](https://github.com/smockle/xcode-default-theme) — the Xcode Default dark and light color palettes for VS Code, faithfully mapped to Neovim highlight groups.

Covers UI, classic vim syntax groups, treesitter (`@*`), and LSP semantic tokens (`@lsp.type.*`).

## Variants

| Name | Background |
|------|------------|
| `xcode-default-dark` | dark |
| `xcode-default-light` | light |

## Installation

### lazy.nvim

```lua
{
  "thomplth/xcode-default.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("xcode-default-dark")
  end,
}
```

### Manual

Copy the files from `colors/` into your Neovim runtime path (e.g. `~/.config/nvim/colors/`), then:

```vim
:colorscheme xcode-default-dark
:colorscheme xcode-default-light
```

## macOS adaptive switching

```lua
local function sync_colorscheme()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result:match("Dark") then
      vim.cmd.colorscheme("xcode-default-dark")
    else
      vim.cmd.colorscheme("xcode-default-light")
    end
  end
end

sync_colorscheme()

vim.api.nvim_create_autocmd("FocusGained", { callback = sync_colorscheme })
```
