# Runs when a player is not on the correct team to hold an item, including when they are jailed, or when a point cannot be scored due to a player of the opposite team not being on

# Blue team items

# If player is not on blue team
# Flag
# Put the red flag back
execute as @a[team=!ctf_blue, nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] at @e[tag=red] run setblock ~ ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""}
# Clear the red flag from the player
execute as @a[team=!ctf_blue, nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] run clear @s red_banner{display:{Name:"\"§r§4Red Flag§r\""}}
# Card
# Put the card back in barrel
execute as @a[team=!ctf_blue, nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,blue:1}}]}] at @e[tag=red] run loot insert ~ ~ ~ loot ctf:bluecard
# Clear the card from the player's inventory
execute as @a[team=!ctf_blue, nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,blue:1}}]}] run clear @s minecraft:flower_banner_pattern{ctf:1,blue:1}

# If player is on blue team but no red team mebers have been on for at least 1 minute and the player is within 500 of the blue base
# Put the red flag back at red base
execute if score #Blue ctf_logout matches ..0 unless entity @a[team=ctf_red] as @a[nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] at @a[nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] positioned as @e[tag=blue, distance=..500] at @e[tag=red] run setblock ~ ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""}
# Clear the flag from the player's inventory
execute if score #Blue ctf_logout matches ..0 unless entity @a[team=ctf_red] as @a[nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] at @a[nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] positioned as @e[tag=blue, distance=..500] run clear @s red_banner{display:{Name:"\"§r§4Red Flag§r\""}}


# Red team items

# If player is not on red team
# Flag
# Put the red flag back
execute as @a[team=!ctf_red, nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] at @e[tag=blue] run setblock ~ ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""}
# Clear the blue flag from the player
execute as @a[team=!ctf_red, nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] run clear @s blue_banner{display:{Name:"\"§r§1Blue Flag§r\""}}
# Card
# Put the card back in barrel
execute as @a[team=!ctf_red, nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,red:1}}]}] at @e[tag=blue] run loot insert ~ ~ ~ loot ctf:redcard
# Clear the card from the player's inventory
execute as @a[team=!ctf_red, nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,red:1}}]}] run clear @s minecraft:flower_banner_pattern{ctf:1,red:1}

# If player is on red team but no blue team mebers have been on for at least 1 minute and the player is within 500 of the red base
# Put the blue flag back at blue base
execute if score #Red ctf_logout matches ..0 unless entity @a[team=ctf_blue] as @a[nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] at @a[nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] positioned as @e[tag=red, distance=..500] at @e[tag=blue] run setblock ~ ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""}
# Clear the flag from the player's inventory
execute if score #Red ctf_logout matches ..0 unless entity @a[team=ctf_blue] as @a[nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] at @a[nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] positioned as @e[tag=red, distance=..500] run clear @s blue_banner{display:{Name:"\"§r§1Blue Flag§r\""}}