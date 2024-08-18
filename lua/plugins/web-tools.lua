return {
	{
		'litoj/colorizer.nvim',
		config = function()
			require('colorizer').setup {
				filetypes = { '*' },
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					-- can be a boolean, or:
					-- table like {Name='#colorhex'},
					-- function returning such table (for colorscheme-dependant updates),
					-- "nvim": for all neovim "Name" codes like Blue ...,
					-- "tailwind" (_lsp/_both): for tailwind/css-like color names
					names = 'nvim',
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					AARRGGBB = true, -- 0xAARRGGBB hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes for `mode`: foreground, background,  virtualtext
					mode = 'background', -- Set the display mode.
					-- Available methods are false / true / "normal" / "lsp" / "both"
					-- True is same as normal
					-- parsers can contain values used in |user_default_options|
					sass = { enable = false, parsers = { css } }, -- Enable sass colors
					virtualtext = '■',
					-- update color values even if buffer is not focused
					always_update = false,
				},
				-- all the sub-options of filetypes apply to buftypes
				buftypes = {},
			}
		end,
	},
	{
		'ray-x/web-tools.nvim',
		config = function()
			require('web-tools').setup {
				keymaps = {
					rename = nil, -- by default use same setup of lspconfig
					repeat_rename = '.', -- . to repeat
				},
				hurl = { -- hurl default
					show_headers = false, -- do not show http headers
					floating = false, -- use floating windows (need guihua.lua)
					json5 = true, -- use json5 parser require json5 treesitter
					formatters = { -- format the result by filetype
						json = { 'jq' },
						html = {},
					},
				},
			}
		end,
	},
}
