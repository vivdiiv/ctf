# Runs when world starts or when /reload is run

# Make blue team
team add ctf_blue "Blue Team"
team modify ctf_blue color blue
team modify ctf_blue nametagVisibility always

# Make blue jail
team add ctf_jail_blue "Blue Jailed Players"
team modify ctf_jail_blue color blue
team modify ctf_jail_blue prefix {"text":"[J] ","color":"dark_purple"}
team modify ctf_jail_blue nametagVisibility always

# Make red team
team add ctf_red "Red Team"
team modify ctf_red color dark_red
team modify ctf_red nametagVisibility always

# Make red jail
team add ctf_jail_red "Red Jailed Players"
team modify ctf_jail_red color dark_red
team modify ctf_jail_red prefix {"text":"[J] ","color":"dark_purple"}
team modify ctf_jail_red nametagVisibility always

# Scoreboard values to handle player interaction 
scoreboard objectives add ctf_hitter minecraft.custom:minecraft.damage_dealt
scoreboard objectives add ctf_hit minecraft.custom:minecraft.damage_taken

# Scoreboard to handle team selector
scoreboard objectives add ctf_team dummy
scoreboard players set #team ctf_team 0

# Scoreboard to handle constants for timer calculation
scoreboard objectives add ctf_constant dummy
scoreboard players set #ctf_1 ctf_constant 1
scoreboard players set #ctf_1200 ctf_constant 1200

# Scoreboard for cooldown timers
scoreboard objectives add ctf_cooldown dummy
scoreboard players set #Blue ctf_cooldown 0
scoreboard players set #Red ctf_cooldown 0
scoreboard objectives add ctf_time dummy

# Scoreboard for logout timers
scoreboard objectives add ctf_logout dummy
scoreboard players set #Blue ctf_logout 1200
scoreboard players set #Red ctf_logout 1200

# Scoreboard for scores
scoreboard objectives add ctf_score dummy "CTF Score"
team join ctf_red Red
team join ctf_blue Blue

# Scoreboard for if flag is held by player
scoreboard objectives add ctf_flag_held dummy