#Placing block1
execute at @s align xyz run summon armor_stand ~0.5 ~1 ~0.5 {Marker:1b,Invisible:1b,Tags:["teleporter"],Pose:{Head:[0f,180f,0f]},equipment:{head:{id:"minecraft:item_frame",count:1,components:{"minecraft:custom_model_data":{strings:["teleporter"]}}}}}
execute at @s run setblock ~ ~ ~ minecraft:cobblestone_wall
execute at @s run setblock ~ ~1 ~ minecraft:cobblestone
execute at @s run summon interaction ~ ~1.2 ~ {width:1.01f,height:0.5f,response:1b,Tags:["teleporter_interaction"]}
execute at @s run summon text_display ~ ~2.25 ~ {width:1f,height:1f,billboard:"vertical",Tags:["teleporter_name"],text:{"color":"#ffffff","text":"-"}}

execute at @s align xyz run playsound minecraft:block.stone.place block @a[distance=..16]
execute as @s at @s positioned ~ ~ ~ run forceload add ~ ~ ~ ~
kill @s