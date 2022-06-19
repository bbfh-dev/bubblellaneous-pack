execute unless entity @p[distance=..3, nbt={SelectedItem:{tag:{CustomModelData:85200}}}] run setblock ~ ~ ~ air
execute unless entity @p[distance=..3, nbt={SelectedItem:{tag:{CustomModelData:85200}}}] run tag @s remove -buln.broken
execute if entity @p[distance=..3, nbt={SelectedItem:{tag:{CustomModelData:85200}}}] run setblock ~ ~ ~ tripwire
execute if entity @p[distance=..3, nbt={SelectedItem:{tag:{CustomModelData:85200}}}] run tag @s add -buln.broken