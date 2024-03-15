# Invoked by player

# Place red base at current location
setblock ~ ~ ~ barrel[facing=up]{CustomName:"[\"§r§4Red Jail§r\"]"}
setblock ~ ~1 ~ red_banner{CustomName:"[\"§r§4Red Flag§r\"]"} 
setblock ~1 ~ ~ red_concrete
summon minecraft:armor_stand ~ ~ ~ {Tags:["red"],Marker:1b,Invisible:1b,NoGravity:1b}