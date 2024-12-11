return {
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()
    end,
  },
  {
    'smoka7/hop.nvim',
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
