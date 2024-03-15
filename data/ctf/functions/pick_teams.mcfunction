# Invoked by player

# Randomly select a player not on a team and add them to a team based on the ctf_team value of a dummy player
execute as @r[team=] if score #team ctf_team matches 0 as @s run function ctf:assign_red
execute as @r[team=] if score #team ctf_team matches 1 as @s run function ctf:assign_blue