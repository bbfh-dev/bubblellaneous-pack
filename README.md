# 🫧 Bubblellaneous Pack

This Minecraft pack adds Furniture, Technology, Food & Miscellaneous blocks and items.

<!-- vim-markdown-toc GFM -->

* [❤️ Contributors](#-contributors)
* [🤝 Contributing / Help](#-contributing--help)
    * [Translators](#translators)
    * [Developers](#developers)
    * [Financial support](#financial-support)
* [🛠️ Building from source](#-building-from-source)

<!-- vim-markdown-toc -->

# ❤️ Contributors

| Name                    | Contribution             |
| ----------------------- | -------------------      |
| FBreakDance30           | 🇮🇹 Italian translation |

# 🤝 Contributing / Help

I appreciate everybody who helps the project. As a contributor you get a discord role and a mention of your name on the project page + in-game.

## Translators

If you wish to translate the project into a language, just tell me in discord or create an [issue](https://github.com/bbfh-dev/bubblellaneous-pack/issues/new). You'll be able to change translation with a Google Sheet document or using your own editor that supports importing from `.tsv` files.

## Developers

If you wish to create your own fork / improve the project feel free to create pull requests. You can find instructions on how to build project from source below. The datapack logic / resourcepack can be found inside `src/` directory. `plugins/` contains generated parts of the project, the one you might be most interested in is `plugins/bubblellaneous/blocks.py` and `plugins/bubblellaneous/items.py` for adding/removing content.

## Financial support

You can reach out to me if you wish to make a donation to help out the project.

# 🛠️ Building from source

This pack uses [Beet](https://github.com/mcbeet/beet) Python module, and [rye](https://github.com/mitsuhiko/rye) for project dependency managment.

**Step 1. Set up your virtual environment:**

- Create a virtual environment with the python version from `.python-version` file to ensure the code compiles.
- Run `pip install -r requirements.lock`.

**Step 2. Build the project:**

- Run `beet build` or `beet watch` to build the project into `dist/` directory.
