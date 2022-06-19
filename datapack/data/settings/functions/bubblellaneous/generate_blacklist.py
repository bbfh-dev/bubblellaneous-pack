import pathlib
from random import randint

THIS_PATH = pathlib.Path().absolute()
PATH = THIS_PATH.parent.parent.parent / 'bubblellaneous' / 'functions' / 'block' / 'bubble_bench' / 'setup'
CATEGORIES = ['furniture.mcfunction', 'food.mcfunction', 'miscellaneous.mcfunction', 'security.mcfunction']
NAMES = {
    'furniture.mcfunction': 'Furniture',
    'food.mcfunction': 'Food',
    'miscellaneous.mcfunction': 'Miscellaneous',
    'security.mcfunction': 'Security',
}

blacklist = open(THIS_PATH.parent.parent.parent / 'bubblellaneous' / 'functions' / 'block' / 'bubble_bench' / 'blacklist' / 'add.mcfunction', 'w')

for category in CATEGORIES:
    size = 0
    file = open(PATH / category, 'r')
    for line in file.readlines():
        if line.startswith('data modify'):
            size += 1
    file.close()

    line = '['
    for i in range(size):
        line += '{"nbt":"' + NAMES.get(category) + '[' + str(i) +'].name", "storage":"bubblellaneous:crafting", "interpret":true, "color":"' + '#'+ str(hex(randint(0,16777215)))[2:] + '", "clickEvent":{"action":"run_command", "value":"/data modify storage bubblellaneous:crafting ' + NAMES.get(category) +'[' + str(i) + '].icon set value -1"}, "hoverEvent":{"action":"show_text", "contents":"Click to add to blacklist"}},", ",'
        if i % 2 == 0:
            blacklist.write('tellraw @s ' + line + '""]\n')
            line = '['
    blacklist.write('tellraw @s ' + line + '""]\n')

blacklist.close()


blacklist = open(THIS_PATH.parent.parent.parent / 'bubblellaneous' / 'functions' / 'block' / 'bubble_bench' / 'blacklist' / 'remove.mcfunction', 'w')

for category in CATEGORIES:
    size = 0
    file = open(PATH / category, 'r')
    for line in file.readlines():
        if line.startswith('data modify'):
            size += 1
    file.close()

    line = '['
    for i in range(size):
        line += '{"nbt":"' + NAMES.get(category) + '[' + str(i) +'].name", "storage":"bubblellaneous:crafting", "interpret":true, "color":"' + '#'+ str(hex(randint(0,16777215)))[2:] + '", "clickEvent":{"action":"run_command", "value":"/data modify storage bubblellaneous:crafting ' + NAMES.get(category) +'[' + str(i) + '].icon set value -1"}, "hoverEvent":{"action":"show_text", "contents":"Click to add to blacklist"}},", ",'
        if i % 2 == 0:
            blacklist.write('tellraw @s ' + line + '""]\n')
            line = '['
    blacklist.write('tellraw @s ' + line + '""]\n')

blacklist.close()