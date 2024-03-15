# Runs when a player is hit while carrying a flag or get out of jail card

# Blue team

# Flag
# Let server know flag is recovered and player has been jailed
execute if entity @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held] as @s run tellraw @a [{"text":"The ","color":"yellow"},{"text":"red flag","color":"dark_red"},{"text":" has been recovered by ","color":"yellow"},{"selector":"@s","color":"dark_red"},{"text":"!","color":"yellow"}]
execute if entity @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held] as @s run tellraw @a [{"selector":"@a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held]","color":"blue"},{"text":" has been jailed!","color":"yellow"}]
# Put the player in jail
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held] run team join ctf_jail_blue @s
# Put a blue get out of jail card in red jail barrel
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held] at @e[tag=red] run loot insert ~ ~ ~ loot ctf:bluecard

# Card
# Let server know player has been jailed
execute if entity @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_card_held] as @s run tellraw @a [{"selector":"@a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_card_held]","color":"blue"},{"text":" has been jailed!","color":"yellow"}]
# Put the player in jail
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_card_held] run team join ctf_jail_blue @s
# Put a blue get out of jail card in red jail barrel
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_card_held] at @e[tag=red] run loot insert ~ ~ ~ loot ctf:bluecard

# Red team

# Flag
# Let server know flag is recovered and player has been jailed
execute if entity @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held] as @s run tellraw @a [{"text":"The ","color":"yellow"},{"text":"blue flag","color":"blue"},{"text":" has been recovered by ","color":"yellow"},{"selector":"@s","color":"blue"},{"text":"!","color":"yellow"}]
execute if entity @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held] as @s run tellraw @a [{"selector":"@a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held]","color":"dark_red"},{"text":" has been jailed! ","color":"yellow"}]
# Put the player in jail
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held] run team join ctf_jail_red @s
# Put a blue get out of jail card in red jail barrel
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held] at @e[tag=blue] run loot insert ~ ~ ~ loot ctf:redcard

# Card
# Let server know player has been jailed
execute if entity @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_card_held] as @s run tellraw @a [{"selector":"@a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_card_held]","color":"red"},{"text":" has been jailed!","color":"yellow"}]
# Put the player in jail
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_card_held] run team join ctf_jail_red @s
# Put a blue get out of jail card in red jail barrel
execute as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_card_held] at @e[tag=blue] run loot insert ~ ~ ~ loot ctf:redcard