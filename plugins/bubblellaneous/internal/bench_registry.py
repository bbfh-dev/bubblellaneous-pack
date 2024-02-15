from dataclasses import dataclass


@dataclass
class BenchRegistry:
    entry: str
    items: list[str]
    count: int = 0

    def update(self):
        self.count = max(min(len(self.items), 64), 1)
        return self
