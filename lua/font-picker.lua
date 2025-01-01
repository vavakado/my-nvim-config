local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function get_fonts()
	local handle = io.popen('fc-list : family | sort | uniq')
	local result = handle:read('*a')
	handle:close()

	local fonts = {}
	local seen = {}
	for font in result:gmatch('[^\n]+') do
		local family = font:gsub('^%s*(.-)%s*$', '%1') -- Trim whitespace
		if not seen[family] then
			table.insert(fonts, { family, 'h12' })
			seen[family] = true
		end
	end

	table.sort(fonts, function(a, b)
		return a[1] < b[1]
	end)

	return fonts
end

local function change_font(font_entry)
	local font_name, font_size = unpack(font_entry)
	vim.o.guifont = font_name .. ':' .. font_size
end

local function font_picker(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = 'Fonts',
			finder = finders.new_table({
				results = get_fonts(),
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry[1],
						ordinal = entry[1],
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					change_font(selection.value)
				end)
				return true
			end,
		})
		:find()
end

vim.api.nvim_create_user_command('TelescopeFontPicker', font_picker, {})

if vim.g.neovide then
	vim.keymap.set('n', '<leader>uf', font_picker, { desc = 'Choose Font' })
end
