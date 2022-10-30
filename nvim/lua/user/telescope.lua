local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "%.git/",
            "node_modules/"
        }
    },
    pickers = {
        live_grep = {
            additional_args = function(_) return { "--hidden" } end
        }
    }
}

telescope.load_extension("fzf")
