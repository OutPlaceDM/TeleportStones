data modify entity @s ArmorItems[0].id set value "minecraft:grass_block"
data modify entity @s ArmorItems[0].count set value 1
$data modify entity @s ArmorItems[0].components.minecraft:custom_name set value '{"text":"$(x) $(y) $(z)"}'
data modify entity @s ArmorItems[0].components.minecraft:custom_model_data set value 19091
execute unless data entity @s ArmorItems[0].components.minecraft:custom_data.dimension run data modify entity @s ArmorItems[0].components.minecraft:custom_data.dimension set from entity @p[distance=..5] Dimension
loot spawn ~ ~ ~ mine ~ ~-2 ~
data modify entity @s ArmorItems[0].id set from entity @e[type=item,distance=..0.5,limit=1] Item.id
function teleport:gui/icon/search_icon with entity @s ArmorItems[0]
kill @e[type=item,distance=..0.5]