local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- change config now

config.default_domain = 'WSL:ArchTestNew'

config.wsl_domains = {
  {
    name = 'WSL:ArchTestNew',
    distribution = 'ArchTestNew',
	username = 'vzhsxn',
	default_cwd = '~',
	-- default_prog = {"zsh"}
  },
}

-- Ensure the FiraCode nerd font is installed
config.font = wezterm.font 'FiraCode Nerd Font'
-- config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.color_scheme = 'Tokyo Night'

return config
