local mainMod = "SUPER"
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("killactive"))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.toggle_floating())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable --enable-features=UseOzonePlatform,VaapiVideoDecodeLinuxGL,VaapiVideoEncoder --ozone-platform=wayland --use-gl=egl --enable-gpu-rasterization --ignore-gpu-blocklist"))
hl.bind(mainMod .. " + F", hl.dsp.fullscreen(0))
hl.bind(mainMod .. " + M", hl.dsp.fullscreen(1))

hl.bind(mainMod .. " + H", hl.dsp.move_focus("l"))
hl.bind(mainMod .. " + L", hl.dsp.move_focus("r"))
hl.bind(mainMod .. " + K", hl.dsp.move_focus("u"))
hl.bind(mainMod .. " + J", hl.dsp.move_focus("d"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("sh -c 'pkill -USR1 ashell'"))