local selected_plugin = 'yuttie/hydrangea-vim'
local selected_colorscheme = 'hydrangea_bright_night'

local plugins = {
  { 'yuttie/hydrangea-vim', branch = 'develop' },
  { 'yuttie/inkstained-vim' },
  { 'yuttie/snowy-vim' },
  { 'yuttie/sublimetext-spacegray.vim' },
  { 'cocopon/iceberg.vim' },
  { 'nordtheme/vim' },
  { 'RRethy/base16-nvim' },
  { 'EdenEast/nightfox.nvim' },
}

for _, plugin in ipairs(plugins) do
  if plugin[1] == selected_plugin then
    plugin.lazy = false
    plugin.priority = 1000
    plugin.config = function()
      vim.cmd(string.format('colorscheme %s', selected_colorscheme))
    end
  else
    plugin.lazy = true
  end
end

return plugins
