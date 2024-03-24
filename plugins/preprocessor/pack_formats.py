PACK_FORMATS: dict[str, list[int]] = {
    "1.20.0": [15],
    "1.20.1": [15],
    "1.20.2": list(range(16, 19)),
    "1.20.3": list(range(19, 27)),
    "1.20.4": [26],
    "1.20.5": list(range(27, 33)),
    "LATEST": [32],
}
