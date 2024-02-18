# 🫧 Bubblellaneous Pack

This Minecraft pack adds Furniture, Technology, Food & Miscellaneous blocks and items.

<!-- vim-markdown-toc GFM -->

* [🛠️ Building from source](#-building-from-source)

<!-- vim-markdown-toc -->

# 🛠️ Building from source

This pack uses [Beet](https://github.com/mcbeet/beet) Python module, and [rye](https://github.com/mitsuhiko/rye) for project dependency managment.

**Step 1. Set up your virtual environment:**

- Create a virtual environment with the python version from `.python-version` file to ensure the code compiles.
- Run `pip install -r requirements.lock`.

**Step 2. Build the project:**

- Run `beet build` or `beet watch` to build the project into `dist/` directory.
