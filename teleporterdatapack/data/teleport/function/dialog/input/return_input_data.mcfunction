scoreboard players reset @s tp_dialog_button
scoreboard players enable @s tp_dialog_button
execute as @s run trigger tp_dialog_button set 3

execute as @s store result storage teleport:data tmp.teleporter_id int 1 run scoreboard players get @s teleporter_user 
$execute as @s run data modify storage teleport:data tmp.new_name set value "$(new_name)"
$execute as @s run data modify storage teleport:data tmp.new_hexcolor set value "$(new_hexcolor)"
execute as @s run function teleport:dialog/input/update_teleporter_data with storage teleport:data tmp