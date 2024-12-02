require "options"
require "mappings"
require "commands"
require "autocmds"

-- bootstrap plugins with lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
local plugins = require "plugins"
require("lazy").setup(plugins, require "plugins/config/lazy")

-- colors
require('colorschemes')
