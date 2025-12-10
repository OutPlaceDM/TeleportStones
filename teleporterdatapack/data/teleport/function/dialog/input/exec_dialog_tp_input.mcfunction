execute as @s run data modify storage teleport:data tmp.new_name set value "$(new_name)"
execute as @s run data modify storage teleport:data tmp.new_hexcolor set value "$(new_hexcolor)"
$execute as @s run data modify storage teleport:data tmp.old_name set from storage teleport:data array.$(teleporter_id).name
$execute as @s run data modify storage teleport:data tmp.old_hexcolor set from storage teleport:data array.$(teleporter_id).hex_color

execute as @s run function teleport:dialog/input/dialog_tp_input with storage teleport:data tmp

data modify storage teleport:data tmp set value {}