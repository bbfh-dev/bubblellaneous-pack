from typing import Any, Self


class NBTVar:
    def __init__(self, value: str) -> None:
        self._value = value

    def __str__(self) -> str:
        return self._value


NBTType = (
    str
    | float
    | int
    | bool
    | dict[str, "NBTType"]
    | list["NBTType"]
    | list[str]
    | NBTVar
)


class NBT:
    class Quote(NBTVar):
        def __init__(self, nbt: NBTType, double: bool = False) -> None:
            if double:
                super().__init__(f'"{nbt}"')
            else:
                super().__init__(f"'{nbt}'")

    class Inject(NBTVar):
        def __init__(self, value: str) -> None:
            super().__init__(value)

    class Double(NBTVar):
        def __init__(self, value: float) -> None:
            super().__init__(f"{value}d")

    class Short(NBTVar):
        def __init__(self, value: int) -> None:
            super().__init__(f"{value}s")

    class Byte(NBTVar):
        def __init__(self, value: int) -> None:
            super().__init__(f"{value}b")

    class IntArray(NBTVar):
        def __init__(self, values: list[int]) -> None:
            super().__init__(f"[I; {', '.join([str(i) for i in values])}]")

    class ByteArray(NBTVar):
        def __init__(self, values: list[int]) -> None:
            super().__init__(f"[B; {', '.join([str(i) for i in values])}]")

    def __init__(
        self,
        data: dict[str, NBTType] | list[NBTType],
        is_json: bool = False,
        overrides: dict = {},
    ):
        self.data = data
        self.is_json = is_json
        self._overrides: dict[str, NBTType | Self] = overrides
        self._properties = []

    def add_override(self, key: str, value: NBTType | Self):
        self._overrides[key] = value
        return self

    def add_property(self, key: str, value: str):
        if self.is_json:
            self._properties.append(f'"{key}": {value}')
        else:
            self._properties.append(f"{key}: {value}")

    def add_list_property(self, value: str):
        if '"' not in value:
            value = value.replace("'", '"')

        self._properties.append(f"{value}")

    def get_dict(self) -> str:
        for key, value in self.data.items():  # type: ignore
            if type(value) is str and value in self._overrides.keys():
                value = self._overrides.get(value)

            match type(value).__name__:
                case "dict":
                    self.add_property(key, NBT(value, is_json=self.is_json, overrides=self._overrides).get_dict().replace('\\"', '"').replace('"', '\\"'))  # type: ignore
                case "list":
                    self.add_property(
                        key,
                        NBT(
                            value, is_json=self.is_json, overrides=self._overrides  # type: ignore
                        ).get_list(),
                    )
                case "str":
                    self.add_property(key, f'"{value}"')
                case "float":
                    self.add_property(key, f"{value}f")
                case "bool":
                    if self.is_json:
                        self.add_property(key, f"{str(value).lower()}")
                    else:
                        self.add_property(key, f"{int(value is True)}b")
                case _:
                    self.add_property(key, str(value))

        return "{" + ", ".join(self._properties) + "}"

    def get_list(self) -> str:
        for value in self.data:
            if type(value) is str and value in self._overrides.keys():
                value = self._overrides.get(value)

            match type(value).__name__:
                case "dict":
                    self.add_list_property(NBT(value, is_json=self.is_json, overrides=self._overrides).get_dict())  # type: ignore
                case "list":
                    self.add_list_property(
                        NBT(
                            value, is_json=self.is_json, overrides=self._overrides  # type: ignore
                        ).get_list(),
                    )
                case "str":
                    self.add_list_property('"' + str(value) + '"')
                case "float":
                    self.add_list_property(f"{value}f")
                case "bool":
                    if self.is_json:
                        self.add_list_property(f"{str(value).lower()}")
                    else:
                        self.add_list_property(f"{int(value is True)}b")
                case _:
                    self.add_list_property(str(value))

        return "[" + ", ".join(self._properties) + "]"

    def __str__(self) -> str:
        if type(self.data) is dict:
            return self.get_dict()
        return self.get_list()
