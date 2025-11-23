local plugins = {
    { "yuttie/hydrangea-vim", branch = "develop" },
    { "yuttie/inkstained-vim" },
    { "yuttie/snowy-vim" },
    { "yuttie/sublimetext-spacegray.vim" },
    -- Ordered by my preference:
    { "ramojus/mellifluous.nvim" },  -- mellifluous
    { "vague-theme/vague.nvim" },  -- vague
    { "thesimonho/kanagawa-paper.nvim" },  -- kanagawa-paper
    { "EdenEast/nightfox.nvim" },  -- nordfox
    { "jacoborus/tender.vim" },  -- tender
    { "AlexvZyl/nordic.nvim" },  -- nordic
    { "dgox16/oldworld.nvim" },  -- oldworld
}

-- Set common fields for colorschemes
for _, plugin in ipairs(plugins) do
    plugin.lazy = false
    plugin.priority = 1000
end

return plugins
