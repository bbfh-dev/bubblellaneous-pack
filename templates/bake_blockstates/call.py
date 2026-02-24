#!/bin/python3

import sys
import json

if len(sys.argv) != 3:
    sys.exit(1)

block_id = sys.argv[1]
input = json.loads(sys.argv[2])

output = {}


def expand_pattern(pattern):
    results = []

    def recurse(p):
        idx = p.find("x")
        if idx == -1:
            results.append(p)
            return
        recurse(p[:idx] + "i" + p[idx + 1 :])
        recurse(p[:idx] + "o" + p[idx + 1 :])

    recurse(pattern)
    return results


for rule_name in input:
    if rule_name == "default":
        continue

    for entry in input[rule_name]:
        pattern = entry[0]
        rotation = str(entry[1])

        for concrete in expand_pattern(pattern):
            if concrete not in output:
                output[concrete] = {"name": rule_name, "rotation": rotation}

result_json = json.dumps(output, separators=(",", ":"))

print(
    "data modify storage bubblellaneous state_registry.%s set value %s"
    % (block_id, result_json)
)
