# block base
execute as @e[type=minecraft:armor_stand,tag=teleporter] run data merge entity @s {Fire:100s}
execute as @e[type=minecraft:item_frame,tag=teleporter_model] run function teleport:teleporter/place
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless block ~ ~-1 ~ minecraft:cobblestone_wall run function teleport:teleporter/destroy
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s unless block ~ ~ ~ minecraft:barrel run function teleport:teleporter/destroy
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run particle minecraft:enchant ~ ~0.5 ~ 0.3 0.3 0.3 0.5 1 normal

# set the icon item
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run function teleport:gui/icon/set_item with block ~ ~ ~

# tp trigger
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run function teleport:gui/click/detect_slot

# update gui
function teleport:gui/update/run

# clear icon items
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_model_data":19091}}}]
function teleport:gui/icon/run_clear

# join detection
tag @a[scores={tp_join=0}] add no_tp
scoreboard players set @a[scores={tp_join=0}] tp_not_cooldown 60
scoreboard players set * tp_join 0
scoreboard players set @a tp_join 1

# no tp
execute as @a if score @s tp_not_cooldown matches 0.. run scoreboard players remove @a tp_not_cooldown 1
execute as @a if score @s tp_not_cooldown matches 0 run tag @s remove no_tp
execute as @a if score @s tp_not_cooldown matches 0 run scoreboard players reset @s tp_not_cooldown

# get xp level
execute as @a store result score @s tp_level_in run xp query @s levels