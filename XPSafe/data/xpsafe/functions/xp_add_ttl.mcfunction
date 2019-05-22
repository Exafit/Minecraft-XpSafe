#xp_add_lvl-Datei


execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 10000.. run xp add @s 10000 points 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 10000.. run scoreboard players remove @s xps_safe_total 10000

execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 1000.. run xp add @s 1000 points 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 1000.. run scoreboard players remove @s xps_safe_total 1000

execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 100.. run xp add @s 100 points 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 100.. run scoreboard players remove @s xps_safe_total 100

execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 10.. run xp add @s 10 points 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 10.. run scoreboard players remove @s xps_safe_total 10

execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 1.. run xp add @s 1 points 
execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 1.. run scoreboard players remove @s xps_safe_total 1

#führt sich rekursiv aus, bis wert "xps_safe_total" = 0
execute as @a[tag=xps_auszahlen] if score @s xps_safe_total matches 1.. run function xpsafe:xp_add_ttl