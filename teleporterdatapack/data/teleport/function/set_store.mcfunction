$execute as @s unless data storage teleport:data array.$(teleporter_id).x run data modify storage teleport:data array.$(teleporter_id).x set value "$(x)"
$execute as @s unless data storage teleport:data array.$(teleporter_id).y run data modify storage teleport:data array.$(teleporter_id).y set value "$(y)"
$execute as @s unless data storage teleport:data array.$(teleporter_id).z run data modify storage teleport:data array.$(teleporter_id).z set value "$(z)"
$execute as @s unless data storage teleport:data array.$(teleporter_id).dimension run data modify storage teleport:data array.$(teleporter_id).dimension set value "$(dimension)"
$execute as @s unless data storage teleport:data array.$(teleporter_id).item_name run data modify storage teleport:data array.$(teleporter_id).item_name set value "$(item_name)"

$execute as @s unless data storage teleport:data array.$(teleporter_id).name run data modify storage teleport:data array.$(teleporter_id).name set value "new teleporter"
$execute as @s unless data storage teleport:data array.$(teleporter_id).hex_color run data modify storage teleport:data array.$(teleporter_id).hex_color set value "#FFFFFF"