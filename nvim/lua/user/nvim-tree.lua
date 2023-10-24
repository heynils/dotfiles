local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    sync_root_with_cwd = true,
    renderer = {
        icons = {
            symlink_arrow = " -> ",
            show = {
                file = false,
                folder = false,
            },
            glyphs = {
                default = "",
                symlink = "";
                bookmark = "",
                folder = {
                    arrow_closed = ">",
                    arrow_open = "v"
                },
                git = {
                    unstaged = "x",
                    staged = "S",
                    unmerged = "m",
                    renamed = "R",
                    deleted = "D",
                    untracked = "U",
                    ignored = "I"
                }
            }
        }
    },
    view = {
        width = 40,
        signcolumn = "no"
    }
}
