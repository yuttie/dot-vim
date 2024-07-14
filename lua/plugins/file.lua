return {
  {
    'lambdalisue/suda.vim',
    cmd = {
      'SudaRead',
      'SudaWrite',
    },
  },
  {
    'Shougo/vinarise',
    cmd = {
      'Vinarise',
      'VinarisePluginDump',
      'VinarisePluginViewBitmapView',
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
    },
    config = function()
      require('nvim-tree').setup {
      }
    end,
  },
  {
    'jamessan/vim-gnupg',
    branch = 'main',
  },
}
