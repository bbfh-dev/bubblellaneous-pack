from plugins.utils.nbt import NBT

LOOT_TEMPLATE = NBT(
    {
        "pools": [
            {
                "rolls": 1,
                "entries": [
                    {
                        "type": "minecraft:item",
                        "name": "[base_item]",
                        "functions": [
                            {"function": "minecraft:set_nbt", "tag": "[tag]"}
                        ],
                    }
                ],
            }
        ],
        "random_sequence": "[namespace]:[unit]/[name]",
    },
    is_json=True,
)
