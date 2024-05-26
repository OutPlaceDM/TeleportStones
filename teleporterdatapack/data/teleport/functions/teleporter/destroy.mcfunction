#Destroy block1
setblock ~ ~ ~ air
setblock ~ ~-1 ~ air
execute if entity @p[gamemode=survival] run summon item ~ ~-0.5 ~ {PickupDelay:10,Motion:[0.0,0.2,0.0],Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:custom_name":'{"text":"Teleporter","color":"green"}',"minecraft:custom_model_data":1,"minecraft:entity_data":{id:"minecraft:item_frame",Invisible:1b,Tags:["teleporter_model"]}}}}
execute if entity @p[gamemode=survival] run kill @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:cobblestone_wall"}}]
execute if entity @p[gamemode=survival] run kill @e[type=item,distance=..1,limit=1,sort=nearest,nbt={Item:{id:"minecraft:barrel"}}]
execute as @s at @s positioned ~ ~ ~ run forceload remove ~ ~ ~ ~
kill @s