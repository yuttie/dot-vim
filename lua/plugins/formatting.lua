return {
    {
        "dkarter/bullets.vim",
        ft = { "markdown", "text", "gitcommit" },
    },
    "tpope/vim-repeat",
    {
        "junegunn/vim-easy-align",
        cmd = {
            "EasyAlign",
        },
        keys = {
            { mode = { "n", "x" }, "<Space>a", "<Plug>(EasyAlign)", desc = "EasyAlign" },
        },
    },
}
