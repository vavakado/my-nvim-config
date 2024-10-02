return {
	'goolord/alpha-nvim',
	config = function()
		local alpha = require 'alpha'
		local dashboard = require 'alpha.themes.dashboard'

		dashboard.section.header.val = {
			'                      :::!~!!!!!:.',
			'                  .xUHWH!! !!?M88WHX:.',
			'                .X*#M@$!!  !X!M$$$$$$WWx:.',
			'               :!!!!!!?H! :!$!$$$$$$$$$$8X:',
			'              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:',
			'             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!',
			'             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!',
			'               !:~~~ .:!M"T#$$$$WX??#MRRMMM!',
			'               ~?WuxiW*`   `"#$$$$8!!!!??!!!',
			'             :X- M$$$$       `"T#$T~!8$WUXU~',
			'            :%`  ~#$$$m:        ~!~ ?$$$$$$',
			'          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"',
			'.....   -~~:<` !    ~?T#$$@@W@*?$$      /`',
			'W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :',
			'#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`',
			':::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~',
			'.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `',
			'Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!',
			'$R@i.~~ !     :   ~$$$$$B$$en:``',
			'?MXT@Wx.~    :     ~"##*$$$$M~',
		}

		dashboard.section.buttons.val = {
			dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
			dashboard.button('f', '  > Find file', ':cd $HOME/Documents/projects/personal/ | Telescope find_files<CR>'),
			dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
			dashboard.button('n', '󰎚  > Notes', ':cd ~/.nb/home/ | Telescope find_files<CR>'),
			dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
		}

		alpha.setup(dashboard.opts)
	end,
}
