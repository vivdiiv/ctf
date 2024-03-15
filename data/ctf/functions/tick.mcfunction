# Runs every tick in game

# Check for stolen flags and send a message for them to the server if found
execute unless score #Red ctf_logout matches ..0 as @a[tag=!ctf_flag_held,team=ctf_red,nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] at @s unless entity @e[tag=red, distance=..6] run tellraw @a [{"selector":"@s","color":"dark_red"},{"text":" has stolen the ","color":"yellow"},{"text":"blue flag","color":"blue"},{"text":"!","color":"yellow"}]
execute as @a[team=ctf_red,nbt={Inventory:[{id:"minecraft:blue_banner", tag: {display: {Name: '"§r§1Blue Flag§r"'}}}]}] run tag @s add ctf_flag_held
execute unless score #Blue ctf_logout matches ..0 as @a[tag=!ctf_flag_held,team=ctf_blue,nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] at @s unless entity @e[tag=blue, distance=..6] run tellraw @a [{"selector":"@s","color":"blue"},{"text":" has stolen the ","color":"yellow"},{"text":"red flag","color":"dark_red"},{"text":"!","color":"yellow"}]
execute as @a[team=ctf_blue,nbt={Inventory:[{id:"minecraft:red_banner", tag: {display: {Name: '"§r§4Red Flag§r"'}}}]}] run tag @s add ctf_flag_held

# Check for get out of jail cards on player and send a message for them to the server if found
execute as @a[tag=!ctf_card_held,team=ctf_red,nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,red:1}}]}] run tellraw @a [{"selector":"@s","color":"dark_red"},{"text":" is trying to free a team member!","color":"yellow"}]
execute as @a[team=ctf_red,nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,red:1}}]}] run tag @s add ctf_card_held
execute as @a[tag=!ctf_card_held,team=ctf_blue,nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,blue:1}}]}] run tellraw @a [{"selector":"@s","color":"blue"},{"text":" is trying to free a team member!","color":"yellow"}]
execute as @a[team=ctf_blue,nbt={Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,blue:1}}]}] run tag @s add ctf_card_held

# If player no longer has an item in their inventory, clear the tag from them
execute as @a[tag=ctf_flag_held,team=ctf_blue,nbt=!{Inventory:[{id:"minecraft:red_banner"}]}] run tag @s remove ctf_flag_held
execute as @a[tag=ctf_flag_held,team=ctf_jail_blue,nbt=!{Inventory:[{id:"minecraft:red_banner"}]}] run tag @s remove ctf_flag_held
execute as @a[tag=ctf_flag_held,team=ctf_red,nbt=!{Inventory:[{id:"minecraft:blue_banner"}]}] run tag @s remove ctf_flag_held
execute as @a[tag=ctf_flag_held,team=ctf_jail_red,nbt=!{Inventory:[{id:"minecraft:blue_banner"}]}] run tag @s remove ctf_flag_held
execute as @a[tag=ctf_card_held,team=ctf_red,nbt=!{Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,red:1}}]}] run tag @s remove ctf_card_held
execute as @a[tag=ctf_card_held,team=ctf_blue,nbt=!{Inventory:[{id:"minecraft:flower_banner_pattern", tag: {ctf:1,blue:1}}]}] run tag @s remove ctf_card_held

# Check for player hit interaction
execute as @a[scores={ctf_hitter=1..},team=ctf_red] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held] as @a[scores={ctf_hitter=1..},team=ctf_red] unless entity @e[tag=blue, distance=..20] run function ctf:check_hit
execute as @a[scores={ctf_hitter=1..},team=ctf_red] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_card_held] as @a[scores={ctf_hitter=1..},team=ctf_red] unless entity @e[tag=blue, distance=..20] run function ctf:check_hit
execute as @a[scores={ctf_hitter=1..},team=ctf_blue] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held] as @a[scores={ctf_hitter=1..},team=ctf_blue] unless entity @e[tag=red, distance=..20] run function ctf:check_hit
execute as @a[scores={ctf_hitter=1..},team=ctf_blue] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_card_held] as @a[scores={ctf_hitter=1..},team=ctf_blue] unless entity @e[tag=red, distance=..20] run function ctf:check_hit

execute as @a[scores={ctf_hitter=1..},team=ctf_red] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_flag_held] as @a[scores={ctf_hitter=1..},team=ctf_red] unless score #Blue ctf_cooldown matches ..0 run function ctf:check_hit
execute as @a[scores={ctf_hitter=1..},team=ctf_red] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_blue,tag=ctf_card_held] as @a[scores={ctf_hitter=1..},team=ctf_red] unless score #Blue ctf_cooldown matches ..0 run function ctf:check_hit
execute as @a[scores={ctf_hitter=1..},team=ctf_blue] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_flag_held] as @a[scores={ctf_hitter=1..},team=ctf_blue] unless score #Red ctf_cooldown matches ..0 run function ctf:check_hit
execute as @a[scores={ctf_hitter=1..},team=ctf_blue] at @s positioned as @a[scores={ctf_hit=1..},distance=..6,limit=1,sort=nearest,team=ctf_red,tag=ctf_card_held] as @a[scores={ctf_hitter=1..},team=ctf_blue] unless score #Red ctf_cooldown matches ..0 run function ctf:check_hit

# Clear items from any inventory it shouldn't be in
function ctf:clear_flag

# Check if a player should be freed from jail
execute as @a[team=ctf_jail_red,scores={ctf_hit=1..}] at @s positioned as @e[tag=red, distance=..20] positioned as @a[team=ctf_red,scores={ctf_hitter=1..},nbt={SelectedItem:{id:"minecraft:flower_banner_pattern",tag:{ctf:1,red:1}}}] run function ctf:check_jail
execute as @a[team=ctf_jail_blue,scores={ctf_hit=1..}] at @s positioned as @e[tag=blue, distance=..20] positioned as @a[team=ctf_blue,scores={ctf_hitter=1..},nbt={SelectedItem:{id:"minecraft:flower_banner_pattern",tag:{ctf:1,blue:1}}}] run function ctf:check_jail

# Reset player interaction scores
scoreboard players reset @a ctf_hitter
scoreboard players reset @a ctf_hit

# Check if a point is being attempted and cooldown is over
execute if score #Red ctf_cooldown matches ..0 unless score #Red ctf_logout matches ..0 as @e[tag=red] at @e[tag=red] if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run function ctf:check_point
execute if score #Blue ctf_cooldown matches ..0 unless score #Red ctf_logout matches ..0 as @e[tag=blue] at @e[tag=blue] if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run function ctf:check_point

# Check if a point is being attempted and cooldown is not over
execute unless score #Red ctf_cooldown matches ..0 as @e[tag=red] at @e[tag=red] if block ~1 ~1 ~ minecraft:blue_banner{CustomName: "\"§r§1Blue Flag§r\""} run function ctf:get_flag
execute unless score #Blue ctf_cooldown matches ..0 as @e[tag=blue] at @e[tag=blue] if block ~1 ~1 ~ minecraft:red_banner{CustomName: "\"§r§4Red Flag§r\""} run function ctf:get_flag

# Decrement blue team cooldown timer
execute if score #Blue ctf_cooldown matches 0.. run scoreboard players operation #Blue ctf_cooldown -= #ctf_1 ctf_constant
execute if score #Blue ctf_cooldown matches 0.. run scoreboard players operation #Blue ctf_time = #Blue ctf_cooldown
execute if score #Blue ctf_cooldown matches 0.. run scoreboard players operation #Blue ctf_time += #ctf_1200 ctf_constant
execute if score #Blue ctf_cooldown matches 0.. run scoreboard players operation #Blue ctf_time /= #ctf_1200 ctf_constant

# Decrement red team cooldown timer
execute if score #Red ctf_cooldown matches 0.. run scoreboard players operation #Red ctf_cooldown -= #ctf_1 ctf_constant
execute if score #Red ctf_cooldown matches 0.. run scoreboard players operation #Red ctf_time = #Red ctf_cooldown
execute if score #Red ctf_cooldown matches 0.. run scoreboard players operation #Red ctf_time += #ctf_1200 ctf_constant
execute if score #Red ctf_cooldown matches 0.. run scoreboard players operation #Red ctf_time /= #ctf_1200 ctf_constant

# Decrement logout timer if opposing team not online
execute unless entity @a[team=ctf_blue] if score #Red ctf_logout matches 0.. run scoreboard players operation #Red ctf_logout -= #ctf_1 ctf_constant
execute unless entity @a[team=ctf_red] if score #Blue ctf_logout matches 0.. run scoreboard players operation #Blue ctf_logout -= #ctf_1 ctf_constant

# Reset logout timer if opposing team is online
execute as @a[team=ctf_red] unless score #Blue ctf_logout matches 1200 run scoreboard players set #Blue ctf_logout 1200
execute as @a[team=ctf_blue] unless score #Red ctf_logout matches 1200 run scoreboard players set #Red ctf_logout 1200