scoreboard objectives add teleporter dummy
scoreboard objectives add tp_not_cooldown dummy
scoreboard objectives add tp_spread dummy
scoreboard objectives add tp_join dummy
scoreboard objectives add tp_level_in dummy
scoreboard objectives add tp_level_out dummy
scoreboard players set 1 teleporter 1

data modify storage teleporter:gui Items set value []
data modify storage teleporter:gui Icons set value []
data modify storage teleporter:gui Tmp.tp_k set value ""