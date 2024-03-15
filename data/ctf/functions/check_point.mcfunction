# Runs when a point is scored

# Blue team
# Put the red flag back at the red base
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} at @e[tag=red] run setblock ~ ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""}
# Send a message to the server that a point has been scored
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} as @a[team=ctf_blue,sort=nearest,limit=1] run tellraw @a [{"selector":"@s","color":"blue"},{"text":" has scored a point! ","color":"yellow"}]
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} as @a[team=ctf_blue,sort=nearest,limit=1] run title @s title {"text":"You scored a point!","color":"blue"}
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run playsound minecraft:block.note_block.chime neutral @a[team=ctf_blue]
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run playsound minecraft:block.note_block.chime neutral @a[team=ctf_blue_jail]
# Increment score
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run scoreboard players add Blue ctf_score 1
# Set cooldown
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run scoreboard players set #Blue ctf_cooldown 6000
# Remove the red flag from the blue base
execute if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run setblock ~1 ~1 ~ minecraft:air

# Red team

# Put the blue flag back at the blue base
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} at @e[tag=blue] run setblock ~ ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""}
# Send a message to the server that a point has been scored
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} as @a[team=ctf_red,sort=nearest,limit=1] run tellraw @a [{"selector":"@s","color":"dark_red"},{"text":" has scored a point! ","color":"yellow"}]
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} as @a[team=ctf_red,sort=nearest,limit=1] run title @s title {"text":"You scored a point!","color":"dark_red"}
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run playsound minecraft:block.note_block.chime neutral @a[team=ctf_red]
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run playsound minecraft:block.note_block.chime neutral @a[team=ctf_jail_red]
# Increment score
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run scoreboard players add Red ctf_score 1
# Set cooldown
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run scoreboard players set #Red ctf_cooldown 6000
# Remove the blue flag from the red base
execute if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run setblock ~1 ~1 ~ minecraft:air