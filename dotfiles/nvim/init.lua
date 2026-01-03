vim.opt.clipboard = "unnamedplus"
-- lazy.nvim のインストール先を指定
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- もし指定した場所に lazy.nvim がなければ、GitHub からクローンする
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新の安定版を使用
    lazypath,
  })
end

-- Neovim が lazy.nvim を認識できるようにパスを通す
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim の設定開始
require("lazy").setup({
  {
    'nvim-lualine/lualine.nvim', -- 下部に情報を出すバー（計器パネル）
    dependencies = { 'nvim-tree/nvim-web-devicons' } -- アイコンを表示するための部品
  },
})

-- 導入したバー（lualine）を起動する
require('lualine').setup({
  options = {
    theme = 'dracula', -- HUD らしい高コントラストなテーマ
    icons_enabled = true,
  }
})
