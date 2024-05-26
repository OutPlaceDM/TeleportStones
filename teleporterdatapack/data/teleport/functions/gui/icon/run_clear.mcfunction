execute if score Icons teleporter matches ..0 store result score Icons teleporter run data get storage teleporter:gui Icons
scoreboard players operation Icons teleporter -= 1 teleporter
execute store result storage teleporter:gui Icon_count byte 1 run scoreboard players get Icons teleporter

function teleport:gui/icon/clear_loop with storage teleporter:gui