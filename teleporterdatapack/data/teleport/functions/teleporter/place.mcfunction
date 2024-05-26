#Placing block1
execute at @s align xyz run summon armor_stand ~0.5 ~1 ~0.5 {Marker:1b,Invisible:1b,Tags:["teleporter"],Pose:{Head:[0f,180f,0f]},ArmorItems:[{},{},{},{id:"minecraft:item_frame",count:1,components:{"minecraft:custom_model_data":1}}]}
execute at @s run setblock ~ ~ ~ minecraft:cobblestone_wall
execute at @s run setblock ~ ~1 ~ minecraft:barrel
execute at @s align xyz run playsound minecraft:block.stone.place block @a[distance=..16]
execute as @s at @s run tag @a[distance=..5] add no_tp
execute as @s at @s run scoreboard players set @a[distance=..5] tp_not_cooldown 10
execute as @s at @s positioned ~ ~ ~ run forceload add ~ ~ ~ ~
kill @s