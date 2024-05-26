execute as @p[distance=..5,tag=!no_tp] unless score @s tp_level_in matches 10.. run title @s actionbar {"color":"dark_red","text":"You need 10 level for the tp!"}
execute as @p[distance=..5,tag=!no_tp] if score @s tp_level_in matches 10.. run tag @s add teleport_entity
execute as @p[tag=teleport_entity] run function teleport:run/level_op
$execute at @s as @p[tag=teleport_entity] in $(dimension) run tp @s $(tp_k)
$execute in $(dimension) positioned $(tp_k) if entity @p[tag=teleport_entity,distance=..2] run function teleport:run/spreadplayers with block ~ ~ ~
execute as @p[tag=teleport_entity] at @s run playsound minecraft:entity.enderman.teleport master @a[distance=..10]
execute as @p[tag=teleport_entity] at @s run particle minecraft:portal ~ ~1 ~ 0.05 0.05 0.05 2 20 normal
tag @a[tag=teleport_entity] remove teleport_entity