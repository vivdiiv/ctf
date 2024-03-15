# Gives the flag back to the player when the countdown is still going

# Blue team

# Give the player the red flag back
execute at @e[tag=blue] if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} as @a[team=ctf_blue,limit=1,sort=nearest] run give @s red_banner{display:{Name:"\"§r§4Red Flag§r\""}}
# Send a message to the player for how long is left on the counter
execute at @e[tag=blue] unless score #Blue ctf_time matches 1 if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} as @a[team=ctf_blue,limit=1,sort=nearest] run tellraw @s [{"score":{"name":"#Blue","objective":"ctf_time"},"color":"yellow"},{"text":" minutes left until your team can score again!","color":"yellow"}]
execute at @e[tag=blue] if score #Blue ctf_time matches 1 if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} as @a[team=ctf_blue,limit=1,sort=nearest] run tellraw @s [{"score":{"name":"#Blue","objective":"ctf_time"},"color":"yellow"},{"text":" minute left until your team can score again!","color":"yellow"}]
# Remove the red flag from the blue base
execute at @e[tag=blue] if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run setblock ~1 ~1 ~ minecraft:air

# Red team

# Give the player the blue flag back
execute at @e[tag=red] if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} as @a[team=ctf_red,limit=1,sort=nearest] run give @s blue_banner{display:{Name:"\"§r§1Blue Flag§r\""}}
# Send a message to the player for how long is left on the counter
execute at @e[tag=red] unless score #Red ctf_time matches 1 if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} as @a[team=ctf_red,limit=1,sort=nearest] run tellraw @s [{"score":{"name":"#Red","objective":"ctf_time"},"color":"yellow"},{"text":" minutes left until your team can score again!","color":"yellow"}]
execute at @e[tag=red] if score #Red ctf_time matches 1 if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} as @a[team=ctf_red,limit=1,sort=nearest] run tellraw @s [{"score":{"name":"#Red","objective":"ctf_time"},"color":"yellow"},{"text":" minute left until your team can score again!","color":"yellow"}]
# Remove the blue flag from the red base
execute at @e[tag=red] if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run setblock ~1 ~1 ~ minecraft:air