scoreboard players operation @s tp_level_out = @s tp_level_in
scoreboard players remove @s tp_level_out 10
execute store result storage teleport:data tmp.level_out int 1 run scoreboard players get @s tp_level_out
execute as @s run function teleport:run/set_level with storage teleport:data tmp