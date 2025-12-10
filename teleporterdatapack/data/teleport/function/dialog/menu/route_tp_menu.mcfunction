execute as @a if score @s tp_dialog_button matches 1..3 store result storage teleport:data tmp.teleporter_id int 1 run scoreboard players get @s teleporter_user
execute as @a if score @s tp_dialog_button matches 1 run function teleport:dialog/input/exec_dialog_tp_input with storage teleport:data tmp
execute as @a if score @s tp_dialog_button matches 2 run function teleport:dialog/list/exec_dialog_tp_list with storage teleport:data tmp
execute as @a if score @s tp_dialog_button matches 3 run function teleport:dialog/menu/dialog_tp_menu with storage teleport:data tmp
execute as @a if score @s tp_dialog_button matches 4 run scoreboard players reset @s teleporter_user
execute as @a if score @s tp_dialog_button matches 1.. run scoreboard players reset @s tp_dialog_button