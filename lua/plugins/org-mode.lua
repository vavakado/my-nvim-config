return {
	{
		'nvim-orgmode/orgmode',
		event = 'VeryLazy',
		enabled = false,
		ft = { 'org' },
		opts = {
			org_agenda_files = '~/Documents/orgfiles/**/*',
			org_default_notes_file = '~/Documents/orgfiles/refile.org',
		},
	},
}
