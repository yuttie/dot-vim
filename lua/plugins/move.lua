return {
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()
    end,
  },
  {
    'phaazon/hop.nvim',
    branch = 'v1.3',
    cmd = {
      'HopCamelCase',
      'HopLine',
    },
    config = function()
      require'hop'.setup {
        multi_windows = true,
      }
    end,
  },
}
