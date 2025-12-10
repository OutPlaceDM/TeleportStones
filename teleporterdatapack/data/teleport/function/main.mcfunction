# block base
execute as @e[type=minecraft:armor_stand,tag=teleporter] run data merge entity @s {Fire:100s}
execute as @e[type=minecraft:item_frame,tag=teleporter_model] run function teleport:teleporter/place
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless block ~ ~-1 ~ minecraft:cobblestone_wall run function teleport:teleporter/destroy
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless block ~ ~ ~ minecraft:cobblestone run function teleport:teleporter/destroy
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run particle minecraft:enchant ~ ~0.5 ~ 0.3 0.3 0.3 0.5 1 normal

# interaction
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s as @e[distance=..1,sort=nearest,tag=teleporter_interaction] on target run function teleport:dialog/menu/dialog_tp_menu with entity @e[type=armor_stand,distance=..1,sort=nearest,limit=1,tag=teleporter] data
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s as @e[distance=..1,sort=nearest,tag=teleporter_interaction] if data entity @s interaction run data modify entity @s interaction set value {}

# get xp level
execute as @a store result score @s tp_level_in run xp query @s levels

# set store data
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless data entity @s data.teleporter_id store result entity @s data.teleporter_id int 1 run random value 100000000..999999999
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless data entity @s data.dimension run data modify entity @s data.dimension set from entity @p[distance=..200,limit=1] Dimension
execute as @p at @s if dimension minecraft:overworld as @e[type=minecraft:armor_stand,tag=teleporter,distance=..200] at @s unless data entity @s data.item_name run data modify entity @s data.item_name set value "minecraft:grass_block"
execute as @p at @s if dimension minecraft:the_nether as @e[type=minecraft:armor_stand,tag=teleporter,distance=..200] at @s unless data entity @s data.item_name run data modify entity @s data.item_name set value "minecraft:netherrack"
execute as @p at @s if dimension minecraft:the_end as @e[type=minecraft:armor_stand,tag=teleporter,distance=..200] at @s unless data entity @s data.item_name run data modify entity @s data.item_name set value "minecraft:end_stone"
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless data entity @s data.x run data modify entity @s data.x set from entity @s Pos[0]
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless data entity @s data.y run data modify entity @s data.y set from entity @s Pos[1]
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless data entity @s data.z run data modify entity @s data.z set from entity @s Pos[2]
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run function teleport:set_store with entity @s data
function teleport:dialog/menu/route_tp_menu

# run teleport
execute as @a if score @s tp_player matches 1.. at @s store result storage teleport:data tmp.player_teleporter_id int 1 run scoreboard players get @s tp_player
execute as @a if score @s tp_player matches 1.. at @s run function teleport:run/get_tp_data with storage teleport:data tmp
execute as @a if score @s tp_player matches 1.. run scoreboard players reset @s tp_player

# update display name
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s align xyz positioned ~0.5 ~1 ~0.5 run function teleport:update_display_name with entity @s data