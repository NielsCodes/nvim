local M = {}

function M.redistribute_widths()
	local windows = vim.api.nvim_list_wins()
	local total_width = vim.o.columns
	local neotree_width = 40
	local neotree_win = nil
	local other_windows = {}

	for _, win in ipairs(windows) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:match("neo%-tree") then
			neotree_win = win
		else
			table.insert(other_windows, win)
		end
	end

	local target_width
	if neotree_win then
		local remaining_width = total_width - neotree_width
		target_width = math.floor(remaining_width / #other_windows)
		vim.api.nvim_win_set_width(neotree_win, neotree_width)
	else
		target_width = math.floor(total_width / #windows)
	end

	for _, win in ipairs(other_windows) do
		vim.api.nvim_win_set_width(win, target_width)
	end
end

function M.setup()
	vim.api.nvim_create_augroup("WindowRedistribute", { clear = true })

	vim.api.nvim_create_autocmd("VimResized", {
		group = "WindowRedistribute",
		callback = function()
			vim.defer_fn(M.redistribute_widths, 0)
		end,
	})
end

return M
