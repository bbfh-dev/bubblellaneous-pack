# 🫧 Bubblellaneous Pack

This Minecraft pack adds Furniture, Technology, Food & Miscellaneous blocks and items.

To use it you must [install the data pack](https://minecraft.wiki/w/Data_pack#Usage) in your world. All players playing on your server must have [the resource pack installed](https://minecraft.wiki/w/Resource_pack#Java_Edition).

Use `/function menu:bubblellaneous` for settings/debugging!
Use `/function give:bubblellaneous/<item_name>` to give an item.
Use `/function spawn:bubblellaneous/<item_name>` to spawn an item.
Use `/function place:bubblellaneous/<block_name>` to place a block.

| Minecraft version  | Status                                 |
| ------             | -----                                  |
| 1.20.2 and earlier | 🚫 Broken due to Minecraft limitations |
| 1.20.3             | ✅ Supported                           |
| 1.20.4             | ✅ Supported                           |
| 1.20.5             | 🎯 Will be supported in the future     |

If you wish to contribute, refer to [CONTRIBUTING.md](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/CONTRIBUTING.md)

<!-- vim-markdown-toc GFM -->

* [🔖 Translations](#-translations)
* [🖥️ About Bubblellaneous](#-about-bubblellaneous)
* [📦 For Map Makers / Developers](#-for-map-makers--developers)
    * [Storing blocks](#storing-blocks)
    * [Events](#events)
    * [Bubble Bench Blacklist](#bubble-bench-blacklist)
* [🛠️ Building from source](#-building-from-source)
* [🧑‍⚖️ Licensing](#-licensing)

<!-- vim-markdown-toc -->

# 🔖 Translations

Thanks to wonderful people you can enjoy this pack in different languages:

| Maintainer                                         | Translation                |
| -----------------------                            | -----------------          |
| [BubbleFish](https://modrinth.com/user/BubbleFish) | 🇺🇸 English (US) \[100%\] |
| [BubbleFish](https://modrinth.com/user/BubbleFish) | 🇬🇧 English (UK) \[100%\] |
| [BubbleFish](https://modrinth.com/user/BubbleFish) | 🇷🇺 Russian \[100%\]      |
| [Unintegrated](https://linktr.ee/unintegrated)     | 🇨🇿 Czech \[100%\]        |
| [Unintegrated](https://linktr.ee/unintegrated)     | 🌍 Toki Pona \[100%\]      |
| FBreakDance30                                      | 🇮🇹 Italian \[52%\]       |
| Dorlonkho                                          | 🇯🇵 Japanesse \[22%\]     |

If you want to help with translations, refer to [CONTRIBUTING.md](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/CONTRIBUTING.md)

# 🖥️ About Bubblellaneous

This data pack was originally published by me on Nov 21st, 2021. This is a complete rework, designed to be great for survival, map making, and the creation of your content.

- You can obtain all custom content without memorizing recipes using Bubble Bench: Drop a glass bottle onto a crafting table!

![Bubble Bench GUI](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/docs/bubble_bench.png?raw=true)

- Many blocks/items have different variants (variating in color and material):

![Block Variations](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/docs/block_variations.png?raw=true)

- Have fun with all the content! Feel free to [join my discord](https://discord.gg/5kugW5Q7wB):

![Demo](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/docs/demo.jpg?raw=true)

# 📦 For Map Makers / Developers

## Storing blocks

Bubblellaneous uses entities to display blocks, this may become inconvenient for mapmakers. For this reason, there's a way of restoring the block's state when loading from structures using structure blocks or `/place`:

1. Prevent copying before you save all of the blocks: `/function bubblellaneous:blocks/copy_properties/prevent_copying`.
1. Store blocks that you want to save: `/execute as @e[tag=bbln.block] run function bubblellaneous:blocks/copy_properties/save_to_block`.
1. Save the structure. You can now break the blocks.
1. Start copying state: `/function bubblellaneous:blocks/copy_properties/stop_prevent_copying`.
1. Now you can place the saved structure template anywhere and it will automatically restore all data.
1. If you encounter errors, create a GitHub Issue telling which block and how exactly it broke.

## Events

Bubblellaneous has several events that can be used to extend the data pack logic. The way you hook to these events is by creating a [Function tag](https://minecraft.wiki/w/Tag#Java_Edition) in the specified path. The function tag is executed by a certain entity that you can refer to.

> \[!NOTE\]
> If your project requires more events, create a GitHub Issue or message me on Discord, and I'll add it.

**Entity tag** is `@e[tag=bbln.<value>]`. e.g. if the value is `name.test`, then the actual selector is `@e[tag=bbln.name.test]`.

| Function tag                                      | Entity tag          | Description                                                            |
| -----------------------------------------         | ------------------- | -----------------------------                                          |
| `#bubblellaneous:settings/on_load`                | -                   | Settings were loaded/changed                                           |
| `#bubblellaneous:block/all/on_place`              | block               | A block was placed                                                     |
| `#bubblellaneous:block/all/on_break`              | block               | A block was broken. Use `/return 1` to prevent the block from breaking |
| `#bubblellaneous:block/bear_trap/on_catch`        | name.bear_trap      | Bear Trap caught a player                                              |
| `#bubblellaneous:block/bear_trap/on_release`      | name.bear_trap      | Bear Trap released the player                                          |
| `#bubblellaneous:block/electrical_box/on_enable`  | name.electrical_box | An electrical box was toggled on                                       |
| `#bubblellaneous:block/electrical_box/on_disable` | name.electrical_box | An electrical box was toggled off                                      |
| `#bubblellaneous:block/alarm_block/on_trigger`    | name.alarm_block    | An alarm block was triggered with redstone                             |
| `#bubblellaneous:block/alarm_block/on_trigger`    | name.alarm_block    | An alarm block was triggered with redstone                             |

## Bubble Bench Blacklist

You can hide certain blocks/items from Bubble Bench, preventing players from crafting them.

> Substitute `<unit>/<id>` with the following values:
>
> - `<unit>` is either `block` or `item`.
> - `<id>` is the id of the block/item. The same ID is used in commands like `/function give:bubblellaneous/...` for reference.

**Adding unit into blacklist**:

```mcfunction
data modify storage minecraft:bubblellaneous bench_blacklist append value {entry: "<unit>/<id>"}

# Example:
data modify storage minecraft:bubblellaneous bench_blacklist append value {entry: "block/acacia_table"}
```

**Removing unit from blacklist**:

```mcfunction
data remove storage minecraft:bubblellaneous bench_blacklist[{entry: "<unit>/<id>"}]

# Example:
data remove storage minecraft:bubblellaneous bench_blacklist[{entry: "item/white_key"}]
```

The changes will apply on the next `/reload`.

# 🛠️ Building from source

This pack uses [Beet](https://github.com/mcbeet/beet) Python module, and [rye](https://github.com/mitsuhiko/rye) for project dependency management.

**Step 1. Set up your virtual environment:**

- Create a virtual environment with the python version from `.python-version` file to ensure the code compiles.
- Run `pip install -r requirements.lock`.

**Step 2. Build the project:**

- Run `beet build` or `beet watch` to build the project into `dist/` directory.

# 🧑‍⚖️ Licensing

- The project with its python code uses [MIT](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/LICENSE) license.
- All minecraft assets/code use [CC BY-SA 4.0](https://github.com/bbfh-dev/bubblellaneous-pack/blob/main/src/LICENSE) license.
