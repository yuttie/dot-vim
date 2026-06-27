local plugins = {
    { "yuttie/hydrangea-vim", branch = "develop" },
    { "yuttie/inkstained-vim" },
    { "yuttie/snowy-vim" },
    { "yuttie/sublimetext-spacegray.vim" },
    -- Ordered by my preference:
    { "nyoom-engineering/oxocarbon.nvim" },  -- oxocarbon
    {
        "ramojus/mellifluous.nvim",
        opts = {
            colorset = "mellifluous",
        },
    },  -- mellifluous
    { "vague-theme/vague.nvim" },  -- vague
    { "thesimonho/kanagawa-paper.nvim" },  -- kanagawa-paper
    { "EdenEast/nightfox.nvim" },  -- nordfox
    { "jacoborus/tender.vim" },  -- tender
    { "AlexvZyl/nordic.nvim" },  -- nordic
    { "dgox16/oldworld.nvim" },  -- oldworld
    { "rose-pine/neovim", name = "rose-pine" },  -- rose-pine
    { "sainnhe/sonokai" },  -- sonokai
    { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },  -- zenbones
    { "embark-theme/vim", name = "embark" },  -- embark
    { "marekh19/meowsoot.nvim" },  -- meowsoot
}

-- Set common fields for colorschemes
for _, plugin in ipairs(plugins) do
    plugin.lazy = false
    plugin.priority = 1000
end

return plugins
