return {
  {
    'yuttie/hydrangea-vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [=[
      colorscheme hydrangea_dark_night
      ]=]
    end,
  },
  { 'yuttie/inkstained-vim', lazy = true },
  { 'yuttie/snowy-vim', lazy = true },
  { 'yuttie/sublimetext-spacegray.vim', lazy = true },
  { 'cocopon/iceberg.vim', lazy = true },
  { 'nordtheme/vim', lazy = true },
}
