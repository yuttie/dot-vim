local encodings = {
    Cp932 = "cp932",
    Eucjp = "euc-jp",
    Sjis = "sjis",
    Utf8 = "utf-8",
    Utf16 = "utf-16",
    Jis = "iso-2022-jp",
}

for name, enc in pairs(encodings) do
    vim.api.nvim_create_user_command(name, function(opts)
        vim.cmd(string.format("edit%s ++enc=%s %s", opts.bang and "!" or "", enc, opts.args))
    end, { nargs = "?", bang = true })
end

vim.api.nvim_create_user_command("Hitest", "source $VIMRUNTIME/syntax/hitest.vim", {})

vim.api.nvim_create_user_command(
    "HtmlEscape",
    '%!python -c "import html, sys; print(html.escape(sys.stdin.read()))"',
    {}
)
