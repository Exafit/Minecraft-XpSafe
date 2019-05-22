#xp_add_lvl-Datei


execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 100.. run xp add @s 100 levels 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 100.. run scoreboard players remove @s xps_safe_level 100

execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 10.. run xp add @s 10 levels 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 10.. run scoreboard players remove @s xps_safe_level 10

execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 1.. run xp add @s 1 levels 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 1.. run scoreboard players remove @s xps_safe_level 1

#führt sich rekursiv aus, bis Wert "xps_safe_level" = 0
execute as @a[tag=xps_auszahlen] if score @s xps_safe_level matches 1.. run function xpsafe:xp_add_lvl




