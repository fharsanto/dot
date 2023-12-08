-------------------------------------------
-- Uservariables are stored in this file --
-------------------------------------------
local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local home = os.getenv("HOME")

-- If you want different default programs, wallpaper path or modkey; edit this file.
user_vars = {

  -- Autotiling layouts
  layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.floating,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.spiral.dwindle,
  },

  -- Icon theme from /usr/share/icons
  icon_theme = "Papirus-Dark",

  -- Write the terminal command to start anything here
  autostart = {
    "picom --experimental-backends",
    "blueman-applet",
    "nm-applet",
    "./.config/awesome/src/scripts/monitor.sh",
    'xfce4-power-manager --daemon'
  },

  -- Type 'ip a' and check your wlan and ethernet name
  network = {
    wlan = "wlp4s0",
    ethernet = "enp3s0"
  },

  -- Set your font with this format:
  font = {
    -- regular = "JetBrainsMono Nerd Font, 10",
    -- bold = "JetBrainsMono Nerd Font, bold 10",
    -- extrabold = "JetBrainsMono Nerd Font, ExtraBold 10",
    -- specify = "JetBrainsMono Nerd Font"
    regular = "Roboto, 12",
    bold = "Roboto, bold 12",
    extrabold = "Roboto, ExtraBold 12",
    specify = "Roboto"

  },

  -- This is your default Terminal
  terminal = "kitty",

  -- This is the modkey 'mod4' = Super/Mod/WindowsKey, 'mod3' = alt...
  modkey = "Mod4",

  -- place your wallpaper at this path with this name, you could also try to change the path
  -- wallpaper = home .. "/.config/awesome/src/assets/fuji.jpg",
  wallpaper = home .. "/.wallpapers/darth-vader-5k-2019-2560x1440.jpg",

  -- Naming scheme for the powermenu, userhost = "user@hostname", fullname = "Firstname Surname", something else ...
  namestyle = "userhost",

  -- List every Keyboard layout you use here comma seperated. (run localectl list-keymaps to list all averiable keymaps)
  kblayout = { "de", "ru" },

  -- Your filemanager that opens with super+e
  file_manager = "thunar",

  -- Screenshot program to make a screenshot when print is hit
  screenshot_program = "flameshot gui",

  -- alternative Screenshot app
  screenshot_area = "~/.config/awesome/src/scripts/screensht area",

  -- If you use the dock here is how you control its size
  dock_icon_size = dpi(50),

  -- Add your programs exactly like in this example.
  -- First entry has to be how you would start the program in the terminal (just try it if you dont know yahoo it)
  -- Second can be what ever the fuck you want it to be (will be the displayed name if you hover over it)
  -- For steam games please use this format (look in .local/share/applications for the .desktop file, that will contain the number you need)
  -- {"394360", "Name", true} true will tell the func that it's a steam game
  -- Use xprop | grep WM_CLASS and use the *SECOND* string
  -- { WM_CLASS, program, name, user_icon, isSteam }
  dock_programs = {
    -- { "Alacritty", "alacritty", "Alacritty" },
    { "Kitty", "kitty", "Kitty" },
    { "brave", "brave", "Brave" },
    { "firefox", "firefox", "Firefox" },
    -- { "discord", "discord", "Discord" },
    { "Spotify", "spotify", "Spotify" },
    { "Code", "code", "Visual Studio Code" },
    -- { "processing-app-Base", "arduino", "Arduino IDE" },
    { "Zoom", "zoom", "Zoom" },
    -- { "Thunderbird", "thunderbird", "Thunderbird" },
    -- { "Mattermost", "mattermost-desktop", "Mattermost" },
    -- { "Blender", "blender", "Blender" },
    -- { "Steam", "steam", "Steam" },
    -- { "FreeCAD", "freecad", "FreeCAD" },
    -- { "Thunar", "thunar", "Dateien" },
    -- { "Windows", "virsh start Windows_11", "Windows 11", "/home/crylia/Bilder/windows.png", false, 50 }
  }
}
