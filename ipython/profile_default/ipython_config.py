from IPython.terminal.prompts import Token

ipy_config = get_config()

ipy_config.TerminalInteractiveShell.highlighting_style_overrides = {
	Token.Prompt: '#33ffaa',
	Token.OutPrompt: '#ff33aa',

}

c.TerminalInteractiveShell.confirm_exit = False 
c.TerminalInteractiveShell.highlighting_style = 'paraiso-dark'
c.InteractiveShell.colors = 'Linux'

