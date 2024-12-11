return {
  'ggandor/leap.nvim',
  {
    'phaazon/hop.nvim',
    branch = 'v1.3',
    cmd = {
      'HopWord',
      'HopLine',
    },
    config = function()
      require'hop'.setup {
        multi_windows = true,
      }
    end,
  },
}
