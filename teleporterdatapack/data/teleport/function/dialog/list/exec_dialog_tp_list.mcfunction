execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run function teleport:dialog/list/set_id
execute as @s run function teleport:dialog/list/dialog_tp_list with storage teleport:data
data modify storage teleport:data tmp_body_array set value []