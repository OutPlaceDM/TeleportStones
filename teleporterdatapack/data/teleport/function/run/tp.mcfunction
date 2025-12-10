execute as @s run function teleport:run/level_op
$execute as @s at @s in $(dimension) run tp @s $(x) $(y) $(z)
$execute in $(dimension) positioned $(x) $(y) $(z) run spreadplayers ~ ~ 3 3 under $(y) true @s
execute as @s at @s run playsound minecraft:entity.enderman.teleport master @a[distance=..10]
execute as @s at @s run particle minecraft:portal ~ ~1 ~ 0.05 0.05 0.05 2 20 normal