# 🫧 Bubblellaneous Pack

This Minecraft pack adds Furniture, Technology, Food & Miscellaneous blocks and items.

If you wish to contribute, refer to [CONTRIBUTING.md](./CONTRIBUTING.md)

<!-- vim-markdown-toc GFM -->

* [🔖 Translations](#-translations)
* [📦 For Map Makers / Developers](#-for-map-makers--developers)
    * [Storing blocks](#storing-blocks)
    * [Events](#events)
    * [Bubble Bench Blacklist](#bubble-bench-blacklist)
* [🛠️ Building from source](#-building-from-source)
* [🧑‍⚖️ Licensing](#-licensing)

<!-- vim-markdown-toc -->

# 🔖 Translations

Thanks to wonderful people you can enjoy this pack in different languages:

| Name                    | Translation                |
| ----------------------- | -----------------          |
| BubbleFish              | 🇺🇸 English (US) \[100%\] |
| BubbleFish              | 🇬🇧 English (UK) \[100%\] |
| BubbleFish              | 🇷🇺 Russian \[100%\]      |
| FBreakDance30           | 🇮🇹 Italian \[52%\]       |
| dorlonkho               | 🇯🇵 Japanesse \[22%\]     |

If you want to help with translations, refer to [CONTRIBUTING.md](./CONTRIBUTING.md)

# 📦 For Map Makers / Developers

## Storing blocks

Bubblellaneous uses entities to display blocks, this may become inconvinient for mapmakers. For this reason there's a way of restoring block's state when loading from structures using structure blocks or `/place`:

1. Prevent copying before you save all of the blocks: `/function bubblellaneous:blocks/copy_properties/prevent_copying`.
1. Store blocks that you want to save: `/execute as @e[tag=bbln.block] run function bubblellaneous:blocks/copy_properties/save_to_block`.
1. Save the structure. You can now break the blocks.
1. Start copying state: `/function bubblellaneous:blocks/copy_properties/stop_prevent_copying`.
1. Now you can place the saved structure template anywhere and it will automagically restore all data.
1. If you encounter errors, create a GitHub Issue telling which block and how exactly it broke.

## Events

Bubblellaneous has several events that can be used to extend the data pack logic. The way you hook to these events is by creating a [Function tag](https://minecraft.wiki/w/Tag#Java_Edition) in the specified path. The function tag is executed by a certain entity that you can refer to.

> If your project requires more events, create a GitHub Issue or message me on discord, I'll add it.

**Entity tag** is `@e[tag=bbln.<value>]`. e.g. if the value is `name.test`, then the actual selector is `@e[tag=bbln.name.test]`.

| Function tag                                   | Entity tag          | Description                                                            |
| -----------------------------------------      | ------------------- | -----------------------------                                          |
| `#bubblellaneous:block/all/on_place`           | block               | A block was placed                                                     |
| `#bubblellaneous:block/all/on_break`           | block               | A block was broken. Use `/return 1` to prevent the block from breaking |
| `#bubblellaneous:block/bear_trap/on_open`      | name.bear_trap      | Bear Trap released the player                                          |
| `#bubblellaneous:block/electrical_box/enable`  | name.electrical_box | An electrical box was toggled on                                       |
| `#bubblellaneous:block/electrical_box/disable` | name.electrical_box | An electrical box was toggled off                                      |

## Bubble Bench Blacklist

You can hide certain blocks/items from Bubble Bench, preventing players from crafting them.

> Substitute `<unit>/<id>` with the following values:
>
> - `<unit>` is either `block` or `item`.
> - `<id>` is the id of the block/item. The same ID used in commands like `/function give:bubblellaneous/...` for reference.

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

This pack uses [Beet](https://github.com/mcbeet/beet) Python module, and [rye](https://github.com/mitsuhiko/rye) for project dependency managment.

**Step 1. Set up your virtual environment:**

- Create a virtual environment with the python version from `.python-version` file to ensure the code compiles.
- Run `pip install -r requirements.lock`.

**Step 2. Build the project:**

- Run `beet build` or `beet watch` to build the project into `dist/` directory.

# 🧑‍⚖️ Licensing

- The project with its python code uses [MIT](./LICENSE) license.
- All minecraft assets/code use [CC BY-NC-SA 4.0](./src/LICENSE) license.
