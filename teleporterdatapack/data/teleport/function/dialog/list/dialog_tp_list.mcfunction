scoreboard players reset @s tp_dialog_button
scoreboard players enable @s tp_dialog_button
scoreboard players reset @s tp_player
scoreboard players enable @s tp_player
$execute as @s run dialog show @s {type:"minecraft:multi_action",title:{text:"Teleporter",type:"text",color:"#ab1c9f",font:"minecraft:default"},body:$(tmp_body_array),inputs:[],can_close_with_escape:0b,pause:1,actions:[{label:{text:"Back",type:"text"},action:{type:"minecraft:run_command",command:"trigger tp_dialog_button set 3"}}]}