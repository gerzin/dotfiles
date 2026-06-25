-- hl.config({
--   -- Use exec instead of exec_once so it fires on every config reload
--   exec = {
--     "pkill ashell || true", -- Kills the old instance so they don't stack
--     "ashell --config-path ~/.config/ashell/config.toml"
--   },

--   exec = {
--     "hyprpolkitagent"
--   }
-- })

hl.on("hyprland.start", function()
  -- Core Desktop Necessities
  hl.exec_cmd("hyprpolkitagent")
  hl.exec_cmd("swaync")
  
  -- Aesthetics & Ricing
  hl.exec_cmd("ashell --config-path ~/.config/ashell/config.toml")
  hl.exec_cmd("hyprpaper")
  
  -- Hardware & Comfort
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("hypridle")
  
  -- Clipboard
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  
  -- Hyprland Plugin Manager (if you use hyprpm plugins)
  hl.exec_cmd("hyprpm reload")

end)
