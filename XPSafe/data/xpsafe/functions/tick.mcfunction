# Tick-Datei

#entfernt allen spielern die notwendigen Tags
tag @a[tag=xps_einzahlen] remove xps_einzahlen
tag @a[tag=xps_auszahlen] remove xps_auszahlen


#testet nach einzahlen Blockstruktur unter spieler und vergibt Tag "xps_einzahlen"
execute as @a at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] if block ~ ~-1 ~ minecraft:diamond_block if block ~1 ~-1 ~-1 minecraft:gold_block if block ~1 ~-1 ~ minecraft:iron_block if block ~1 ~-1 ~1 minecraft:gold_block if block ~ ~-1 ~-1 minecraft:iron_block if block ~ ~-1 ~1 minecraft:iron_block if block ~-1 ~-1 ~-1 minecraft:gold_block if block ~-1 ~-1 ~ minecraft:iron_block if block ~-1 ~-1 ~1 minecraft:gold_block run tag @s add xps_einzahlen

#speichert bei allen Spielern mit Tag nacheinander den XpLevel und XpTotal Wert in xps_safe_cache und addiert das auf den jeweiligen Wert
#setzte anschließend alle xp und cache auf 0
execute as @a[tag=xps_einzahlen] run scoreboard players set @s xps_safe_cache 0
#execute as @a[tag=xps_einzahlen] at @s store result score @s xps_safe_cache run data get entity @s XpLevel
execute as @a[tag=xps_einzahlen] at @s store result score @s xps_safe_cache run xp query @s levels
execute as @a[tag=xps_einzahlen] run scoreboard players operation @s xps_safe_level += @s xps_safe_cache
#execute as @a[tag=xps_einzahlen] at @s store result score @s xps_safe_cache run data get entity @s XpTotal
execute as @a[tag=xps_einzahlen] at @s store result score @s xps_safe_cache run xp query @s points
execute as @a[tag=xps_einzahlen] run scoreboard players operation @s xps_safe_total += @s xps_safe_cache
execute as @a[tag=xps_einzahlen] run xp set @s 0 levels
execute as @a[tag=xps_einzahlen] run xp set @s 0 points
execute as @a[tag=xps_einzahlen] run scoreboard players set @s xps_safe_cache 0
 


#testet nach auszahlen Blockstruktur unter spieler und vergibt "xps_auszahlen"
execute as @a at @s if block ~ ~ ~ minecraft:heavy_weighted_pressure_plate[power=1] if block ~ ~-1 ~ minecraft:emerald_block if block ~1 ~-1 ~-1 minecraft:iron_block if block ~1 ~-1 ~ minecraft:gold_block if block ~1 ~-1 ~1 minecraft:iron_block if block ~ ~-1 ~-1 minecraft:gold_block if block ~ ~-1 ~1 minecraft:gold_block if block ~-1 ~-1 ~-1 minecraft:iron_block if block ~-1 ~-1 ~ minecraft:gold_block if block ~-1 ~-1 ~1 minecraft:iron_block run tag @s add xps_auszahlen

#Führt Funktion rekursiv aus um xp um 1 zu erhöhen, wenn Wert größer 0
execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 1.. run function xpsafe:xp_add_lvl
execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 0 if score @s xps_safe_total matches 1.. run function xpsafe:xp_add_ttl


#führt jede sekunde eine Funktion mit Nachricht über kontostand aus
scoreboard players add #tick xps_timer 1
execute if score #tick xps_timer matches 20.. run function xpsafe:xp_message
execute if score #tick xps_timer matches 20.. run scoreboard players set #tick xps_timer 0
