# Runs when player is freed from jail

# Blue team

# Sends message to server and puts jailed player back on Blue team
execute as @a[team=ctf_jail_blue,sort:nearest,limit:1] run tellraw @a [{"selector":"@s","color":"blue"},{"text":" has been freed from jail!","color":"yellow"}]
execute as @a[team=ctf_jail_blue,sort:nearest,limit:1] run team join ctf_blue @s
# Clears get out of jail card from the team member that freed the other member
execute as @a[team=ctf_blue,scores={ctf_hitter=1..},nbt={SelectedItem:{id:"minecraft:flower_banner_pattern",tag:{ctf:1,blue:1}}}] run clear @s minecraft:flower_banner_pattern{ctf:1,blue:1} 1

# Red team

# Sends message to server and puts jailed player back on Red team
execute as @a[team=ctf_jail_red,sort:nearest,limit:1] run tellraw @a [{"selector":"@s","color":"dark_red"},{"text":" has been freed from jail!","color":"yellow"}]
execute as @a[team=ctf_jail_red,sort:nearest,limit:1] run team join ctf_red @s
# Clears get out of jail card from the team member that freed the other member
execute as @a[team=ctf_red,scores={ctf_hitter=1..},nbt={SelectedItem:{id:"minecraft:flower_banner_pattern",tag:{ctf:1,red:1}}}] run clear @s minecraft:flower_banner_pattern{ctf:1,red:1} 1