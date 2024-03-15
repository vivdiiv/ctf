# Assigns the player to blue team
team join ctf_red
tellraw @a ["",{"selector":"@s","color":"dark_red"},{"text":" is on ","color":"yellow"},{"text":"red ","color":"dark_red"},{"text":"team!","color":"yellow"}]
scoreboard players set #team ctf_team 1