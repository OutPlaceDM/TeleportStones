data modify storage teleporter:gui Items append from entity @s ArmorItems[0]
data modify storage teleporter:gui Items[-1].Slot set from storage teleporter:gui Count
scoreboard players operation Count teleporter -= 1 teleporter
execute store result storage teleporter:gui Count byte 1 run scoreboard players get Count teleporter