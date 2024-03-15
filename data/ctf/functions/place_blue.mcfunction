# Invoked by player

# Place blue base at current location
setblock ~ ~ ~ barrel[facing=up]{CustomName:"[\"§r§1Blue Jail§r\"]"}
setblock ~ ~1 ~ blue_banner{CustomName:"[\"§r§1Blue Flag§r\"]"}
setblock ~1 ~ ~ blue_concrete
summon minecraft:armor_stand ~ ~ ~ {Tags:["blue"],Marker:1b,Invisible:1b,NoGravity:1b}