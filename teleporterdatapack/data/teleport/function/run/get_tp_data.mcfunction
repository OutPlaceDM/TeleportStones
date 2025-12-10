execute as @s unless score @s tp_level_in matches 10.. run title @s actionbar {"color":"dark_red","text":"You need 10 level for the tp!"}
$execute as @s at @s if score @s tp_level_in matches 10.. run function teleport:run/tp with storage teleport:data array.$(player_teleporter_id)
data modify storage teleport:data tmp set value {}
