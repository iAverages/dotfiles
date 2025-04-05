local M = {}
M.theme = function()
    local colors = {
        darkgray = "#16161d",
        gray = "#839496",
        text = "#f8f8f2",
        innerbg = nil,
        outerbg = "#16161D",
        normal = "#7E22CE",
        insert = "#B39DDB",
        visual = "#FF9800",
        replace = "#F44336",
        command = "#00BCD4",
    }
    return {
        inactive = {
            a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.gray, bg = colors.outerbg },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        visual = {
            a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
            b = { fg = colors.gray, bg = colors.outerbg },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        replace = {
            a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
            b = { fg = colors.gray, bg = colors.outerbg },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        normal = {
            a = { fg = colors.text, bg = colors.normal, gui = "bold" },
            b = { fg = colors.gray, bg = colors.outerbg },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        insert = {
            a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
            b = { fg = colors.gray, bg = colors.outerbg },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        command = {
            a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
            b = { fg = colors.gray, bg = colors.outerbg },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
    }
end
return M
