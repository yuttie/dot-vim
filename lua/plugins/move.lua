return {
  'ggandor/leap.nvim',
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
