execute as @s at @s store result storage teleport:data tmp.teleporter_id int 1 run data get entity @s data.teleporter_id
execute as @s at @s run function teleport:dialog/list/add_to_array with storage teleport:data tmp
