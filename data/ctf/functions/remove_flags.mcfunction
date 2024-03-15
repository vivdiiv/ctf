# Invoked by player

# Remove blue base
execute at @e[type=minecraft:armor_stand,tag=blue] run setblock ~1 ~ ~ minecraft:air
execute at @e[type=minecraft:armor_stand,tag=blue] run setblock ~ ~1 ~ minecraft:air
execute at @e[type=minecraft:armor_stand,tag=blue] run setblock ~ ~ ~ minecraft:air
kill @e[type=minecraft:armor_stand,tag=blue]

# Remove red base
execute at @e[type=minecraft:armor_stand,tag=red] run setblock ~1 ~ ~ minecraft:air
execute at @e[type=minecraft:armor_stand,tag=red] run setblock ~ ~1 ~ minecraft:air
execute at @e[type=minecraft:armor_stand,tag=red] run setblock ~ ~ ~ minecraft:air
kill @e[type=minecraft:armor_stand,tag=red]