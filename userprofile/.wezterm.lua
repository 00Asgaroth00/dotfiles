local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- change config now

local mouse_bindings = {}
-- local launch_menu = {}

config.default_domain = 'WSL: ArchLinux (NIX Home Manager)'

config.wsl_domains = {
  {
    name = 'WSL: ArchLinux (NIX Home Manager)',
    distribution = 'ArchTestNew',
	username = 'vzhsxn',
	default_cwd = '~',
	-- default_prog = {"zsh"}
  },
  {
    name = 'WSL: ArchLinux',
    distribution = 'ArchLinux',
	username = 'vzhsxn',
	default_cwd = '~',
	-- default_prog = {"zsh"}
  },
}

-- -- Launcher Menu
-- if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
--   --- Grab the ver info for later use.
--   local success, stdout, stderr = wezterm.run_child_process { 'cmd.exe', 'ver' }
--   local major, minor, build, rev = stdout:match("Version ([0-9]+)%.([0-9]+)%.([0-9]+)%.([0-9]+)")
--   local is_windows_11 = tonumber(build) >= 22000
--   
--   --- Make it look cool.
--   if is_windows_11 then
--     wezterm.log_info "We're running Windows 11!"
--   end
-- 
--   table.insert(launch_menu, {
--     label = 'PowerShell',
--     args = { 'powershell.exe', '-NoLogo' },
--   })
--   table.insert(launch_menu, {
--     label = 'PowerShell No Profile',
--     args = { 'powershell.exe', '-NoLogo', '-NoProfile' },
--   })
-- end

-- Mousing bindings
mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
}

config.font = wezterm.font_with_fallback {
  {
    family = 'FiraCode Nerd Font'
  },
  {
    family = 'IosevkaTerm NFM'
  },
  {
    family = 'Hack Nerd Font',
  },
  {
    family = 'JetBrains Mono',
  },
}

-- Ensure the FiraCode nerd font is installed
-- config.font = wezterm.font 'FiraCode Nerd Font'
-- config.font = wezterm.font 'JetBrains Mono'
config.font_size = 9
config.color_scheme = 'Tokyo Night'
-- config.launch_menu = launch_menu
config.mouse_bindings = mouse_bindings

return config
