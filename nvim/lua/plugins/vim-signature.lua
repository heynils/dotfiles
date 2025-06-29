return {
    "kshenoy/vim-signature",
    event = "VeryLazy",
    config = function()
        --Mark config
        vim.cmd([[highlight SignatureMarkText guifg=#f9e2af  ctermfg=yellow]])
        vim.cmd([[highlight SignatureMarkerText guifg=#f9e2af ctermfg=yellow]])

        -- Global cycling index
        -- Global cycling index
        _G.mark_cycle_index = 1

        -- List of global marks to cycle
        local mark_cycle_list = { "'A", "'B", "'C", "'D" }

        -- Function to check if a mark is set
        local function is_mark_set(mark)
            local pos = vim.fn.getpos(mark)
            -- pos = {bufnum, lnum, col, off}
            return pos[2] ~= 0
        end

        -- Function to cycle through marks in a given direction
        function _G.cycle_marks(direction)
            local attempts = 0
            local jumped = false
            local index = _G.mark_cycle_index

            while attempts < #mark_cycle_list do
                local mark = mark_cycle_list[index]
                if is_mark_set(mark) then
                    vim.cmd("normal! " .. mark)
                    jumped = true
                    -- Update index for next cycle
                    if direction == "forward" then
                        _G.mark_cycle_index = (index % #mark_cycle_list) + 1
                    else
                        _G.mark_cycle_index = (index - 2) % #mark_cycle_list + 1
                    end
                    break
                else
                    -- Move index in specified direction
                    if direction == "forward" then
                        index = (index % #mark_cycle_list) + 1
                    else
                        index = (index - 2) % #mark_cycle_list + 1
                    end
                    attempts = attempts + 1
                end
            end

            if not jumped then
                vim.notify("No marks 'A, 'B, 'C or 'D are currently set.", vim.log.levels.INFO)
            end
        end

        -- Map <Tab> for forward cycle
        vim.keymap.set("n", "<Tab>", function()
            _G.cycle_marks("forward")
        end, { noremap = true, silent = true, desc = "Cycle 'A 'B 'C forward if set" })

        -- Map <S-Tab> for backward cycle
        vim.keymap.set("n", "<S-Tab>", function()
            _G.cycle_marks("backward")
        end, { noremap = true, silent = true, desc = "Cycle 'A 'B 'C backward if set" })
    end,
}
