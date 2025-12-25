vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.sts = -1
vim.opt.sw = 0
vim.opt.cursorline = true
--require('koala.init').colorscheme()
require('Nachtwald.init').colorscheme()

local function get_syn_id(transparent)
  local synid = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1)
  if transparent then
    return vim.fn.synIDtrans(synid)
  else
    return synid
  end
end

local function get_syn_attr(synid)
  return {
    name = vim.fn.synIDattr(synid, "name"),
    ctermfg = vim.fn.synIDattr(synid, "fg", "cterm"),
    ctermbg = vim.fn.synIDattr(synid, "bg", "cterm"),
    guifg = vim.fn.synIDattr(synid, "fg", "gui"),
    guibg = vim.fn.synIDattr(synid, "bg", "gui"),
  }
end

local function get_syn_info()
  local base_syn = get_syn_attr(get_syn_id(false))
  print("name: " .. base_syn.name ..
        " ctermfg: " .. base_syn.ctermfg ..
        " ctermbg: " .. base_syn.ctermbg ..
        " guifg: " .. base_syn.guifg ..
        " guibg: " .. base_syn.guibg)

  local linked_syn = get_syn_attr(get_syn_id(true))
  print("link to")
  print("name: " .. linked_syn.name ..
        " ctermfg: " .. linked_syn.ctermfg ..
        " ctermbg: " .. linked_syn.ctermbg ..
        " guifg: " .. linked_syn.guifg ..
        " guibg: " .. linked_syn.guibg)
end

vim.api.nvim_create_user_command('SyntaxInfo', get_syn_info, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- lazy.nvim の plugins 配列に追加
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,                    -- ハイライト有効化
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,                    -- インデント補助
      },
      ensure_installed = {
        "c", "cpp", "lua", "python", "javascript", "html", "css", "json", "bash", "dart", "go"
      },
      auto_install = true,
    }
  end
}

})
