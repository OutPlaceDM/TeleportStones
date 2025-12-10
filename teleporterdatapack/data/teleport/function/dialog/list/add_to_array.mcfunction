$execute if data storage teleport:data array.$(teleporter_id).name run data modify storage teleport:data tmp.name set from storage teleport:data array.$(teleporter_id).name
$execute unless data storage teleport:data array.$(teleporter_id).name run data modify storage teleport:data tmp.name set value "new teleporter"
$execute if data storage teleport:data array.$(teleporter_id).hex_color run data modify storage teleport:data tmp.hex_color set from storage teleport:data array.$(teleporter_id).hex_color
$execute unless data storage teleport:data array.$(teleporter_id).hex_color run data modify storage teleport:data tmp.hex_color set value "#FFFFFF"
$data modify storage teleport:data tmp.x set from storage teleport:data array.$(teleporter_id).x
$data modify storage teleport:data tmp.y set from storage teleport:data array.$(teleporter_id).y
$data modify storage teleport:data tmp.z set from storage teleport:data array.$(teleporter_id).z
$data modify storage teleport:data tmp.dimension set from storage teleport:data array.$(teleporter_id).dimension
$data modify storage teleport:data tmp.item_name set from storage teleport:data array.$(teleporter_id).item_name
$data modify storage teleport:data tmp.teleporter_id set value "$(teleporter_id)"
function teleport:dialog/list/list_comp with storage teleport:data tmp
data modify storage teleport:data tmp set value {}