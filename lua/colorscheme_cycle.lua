-- Favorite colorschemes, in cycle order
local favorites = {
    "hydrangea",
    "oxocarbon",
    "mellifluous",
    "nordfox",
    "tender",
    "nordic",
    "oldworld",
    "rose-pine",
    "sonokai",
    "zenbones",
    "zenwritten",
    "neobones",
    "vimbones",
    "rosebones",
    "forestbones",
    "nordbones",
    "tokyobones",
    "seoulbones",
    "duckbones",
    "zenburned",
    "kanagawabones",
    "embark",
    "meowsoot",
}

local current = 1

-- Try to sync the starting index with whatever's already loaded
do
    local active = vim.g.colors_name
    for i, name in ipairs(favorites) do
        if name == active then
            current = i
            break
        end
    end
end

local notif  -- persistent handle for the cycle notification

local function set_scheme(idx)
    local name = favorites[idx]
    local ok, err = pcall(vim.cmd.colorscheme, name)
    if ok then
        current = idx
        notif = vim.notify(
            ("colorscheme: %s (%d/%d)"):format(name, idx, #favorites),
            vim.log.levels.INFO,
            { replace = notif, id = "colorscheme_cycle", title = "Colorscheme" }
        )
    else
        vim.notify(("failed to load %q: %s"):format(name, err), vim.log.levels.WARN)
    end
end

local function cycle(step)
    -- 1-based modular arithmetic for wraparound in both directions
    local n = #favorites
    local idx = (current - 1 + step) % n + 1
    set_scheme(idx)
end

vim.keymap.set("n", "<Space>Cn", function() cycle(1) end,  { desc = "Colorscheme: next" })
vim.keymap.set("n", "<Space>Cp", function() cycle(-1) end, { desc = "Colorscheme: prev" })
vim.keymap.set("n", "<A-ScrollWheelDown>", function() cycle(1) end,  { desc = "Colorscheme: next" })
vim.keymap.set("n", "<A-ScrollWheelUp>", function() cycle(-1) end, { desc = "Colorscheme: prev" })
