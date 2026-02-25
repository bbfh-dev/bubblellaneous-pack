#!/bin/python3

import sys
import json
import itertools

if len(sys.argv) != 3:
    sys.exit(1)

block_id = sys.argv[1]
input_data = json.loads(sys.argv[2])

output = {}

directions = ["infront", "behind", "leftward", "rightwards", "above", "below"]

for rule_name, entries in input_data.items():
    if rule_name == "default":
        continue
    for entry in entries:
        rotation = str(entry["rotation"])
        allowed_chars = []
        for d in directions:
            cond = entry[d]
            if cond == "block":
                allowed_chars.append(["i"])
            elif cond == "air":
                allowed_chars.append(["o"])
            else:  # cond == "*"
                allowed_chars.append(["i", "o"])

        for combo in itertools.product(*allowed_chars):
            pattern = "".join(combo)
            if pattern not in output:
                output[pattern] = {"name": rule_name, "rotation": rotation}

result_json = json.dumps(output, separators=(",", ":"))

print(
    "data modify storage bubblellaneous state_registry.%s set value %s"
    % (block_id, result_json)
)
