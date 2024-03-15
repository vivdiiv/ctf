# Assigns the player to blue team
team join ctf_blue
tellraw @a ["",{"selector":"@s","color":"blue"},{"text":" is on ","color":"yellow"},{"text":"blue ","color":"blue"},{"text":"team!","color":"yellow"}]
scoreboard players set #team ctf_team 0