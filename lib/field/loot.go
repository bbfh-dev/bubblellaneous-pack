package field

const LOOT_TABLE = `{
  "type": "minecraft:command",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "[base_item]",
          "functions": [
            {
              "function": "minecraft:set_components",
              "components": [components]
            }
          ]
        }
      ]
    }
  ]
}`
