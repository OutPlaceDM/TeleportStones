data modify storage teleporter:gui Items set value []

execute if score Count teleporter matches ..0 store result score Count teleporter if entity @e[tag=teleporter]
execute store result score Count_TP teleporter if entity @e[tag=teleporter]
execute as @e[type=minecraft:armor_stand,tag=teleporter] at @s run function teleport:gui/update/set_single