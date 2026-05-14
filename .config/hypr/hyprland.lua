------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "",
	mode = "highrr",
	position = "auto",
	scale = "1.2",
	transform = 0,
})

-----------------------
---- ENVIRONMENT -----
-----------------------

hl.config({
	cursor = {
		sync_gsettings_theme = false,
	},
	xwayland = {
		force_zero_scaling = true,
	},
	dwindle = {
		preserve_split = true,
	},
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:swapescape,compose:ralt",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = -0.25,
		accel_profile = "flat",
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.15,
		},
	},
})

hl.device({
	name = "mouse",
	sensitivity = -0.5,
})

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_THEME", "Adwaita")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("DBUS_SESSION_BUS_ADDRESS", "unix:path=/run/user/1000/bus")

-------------------
---- STARTUP ------
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper") -- Wallpaper
	hl.exec_cmd("mako -c ~/.config/mako/config.ini") -- Notifications
	hl.exec_cmd("/usr/libexec/polkit-gnome-authentication-agent-1") -- Request root GUI
	hl.exec_cmd("waybar") -- Bar
	hl.exec_cmd("hypridle") -- Idle timer
	hl.exec_cmd("bitwarden-desktop-bin") -- Password manager
	hl.exec_cmd("gentoo-pipewire-launcher restart") -- Wireplumber
	hl.exec_cmd("kdeconnectd") -- Kdeconnect background
	hl.exec_cmd("dbus-daemon --session --address=unix:path=$XDG_RUNTIME_DIR/bus") -- Launch dbus session manually
	hl.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 1")
	hl.exec_cmd("~/.scripts/ntfy/simple-ntfy-listener.sh main,uptime-kuma,yuri-vault,yuri-vault-backups,yuri-vault-zfs")
	hl.exec_cmd("hyprctl setcursor Adwaita 24")
	hl.exec_cmd("hyprlauncher -t -d")
end)

-------------------
---- KEYBINDS -----
-------------------

local mainMod = "SUPER"
-- local menu_open_cmd = "pkill -9 wofi || hyprctl -j activewindow | jq -er '.class // \"\"' | grep -qx 'xfreerdp' || exec wofi --show drun --allow-images"

-- Application binds
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("kitty distrobox enter arch"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("distrobox enter arch -- pear-desktop"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("distrobox enter arch -- feishin"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/hyprshot"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/hyprshot"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a -f hex"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("makoctl dismiss"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("makoctl dismiss -a"))
-- hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd(menu_open_cmd), { release = true })
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("hyprlauncher -t"), { release = true })
hl.bind("CTRL + ALT + SHIFT_L", hl.dsp.exec_cmd("hyprlock"))

-- WM actions
hl.bind("F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.pin({ action = "toggle" }))
hl.bind(mainMod .. " + code:36", hl.dsp.focus({ urgent_or_last = true })) -- Code:36: Enter key
hl.bind(mainMod .. " + N", hl.dsp.layout("togglesplit"))
hl.bind("CTRL + ALT + M", hl.dsp.exit())

-- Grouping
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { release = true })
hl.bind("ALT + TAB", hl.dsp.group.next())
hl.bind("ALT + SHIFT + TAB", hl.dsp.group.prev())

hl.bind(mainMod .. " + G + H", function()
	hl.dsp.window.move({ into_group = "left" })
end)
hl.bind(mainMod .. " + G + J", function()
	hl.dsp.window.move({ into_group = "down" })
end)
hl.bind(mainMod .. " + G + K", function()
	hl.dsp.window.move({ into_group = "up" })
end)
hl.bind(mainMod .. " + G + L", function()
	hl.dsp.window.move({ into_group = "right" })
end)

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move window with mainMod + Shift + vim keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Resize window with mainMod + offset vim keys
hl.bind(mainMod .. " + U", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + I", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + O", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + P", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

-- Resize window with mainMod + Shift + offset vim keys
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })

-- Rotate screen with Control + Alt + 1-4
local function set_rotation(transform)
	hl.config({
		input = {
			touchdevice = { transform = transform },
			tablet = { transform = transform },
		},
	})
	hl.monitor({ output = "", transform = transform })
end

for i = 0, 3 do
	hl.bind("CTRL + ALT + " .. (i + 1), function()
		set_rotation(i)
	end)
end

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Mouse binds
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Special keys binds
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 2%+ -l 1"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 2%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("loginctl lock-session"), { locked = true })

----------------------
---- WINDOW RULES ----
----------------------

hl.window_rule({
	name = "kitty-border-glow",
	match = { class = "kitty" },
	border_color = { colors = { "#de00a3ee", "#05aff7ee" }, angle = 45 },
})

hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "code" }, opacity = 0.95 })
hl.window_rule({ match = { class = "Cinny" }, opacity = 0.95 })
hl.window_rule({ match = { class = "steam" }, opacity = 0.95 })
hl.window_rule({ match = { class = "nemo" }, opacity = 0.95 })
hl.window_rule({ match = { class = "thunderbird" }, opacity = 0.95 })
hl.window_rule({ match = { title = "LibreWolf" }, opacity = 0.90 })
hl.window_rule({ match = { title = "New Tab — LibreWolf" }, opacity = 0.90 })
hl.window_rule({ match = { class = "fim" }, float = true })
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true, no_initial_focus = true })
hl.window_rule({ match = { xwayland = true }, no_initial_focus = true })

-----------------
---- GENERAL ----
-----------------

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 5,
		border_size = 3,
		col = {
			active_border = { colors = { "rgba(de00a3ee)", "rgba(05aff7ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = true,
		layout = "dwindle",
	},
	decoration = {
		rounding = 7,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.15,
		},
	},
	animations = {
		enabled = true,
	},
	misc = {
		font_family = "Nerd Fonts 0xProto",
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		disable_autoreload = true,
		allow_session_lock_restore = true,
	},
})

hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
hl.permission({ binary = ".*", type = "keyboard", mode = "ask" })

hl.curve("windowBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "windowBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "default", style = "slide" })
hl.animation({ leaf = "borderangle", enabled = false })
