from typing import Any

numbers = {
    "0": [
        " _ ",
        "| |",
        "|_|",
        "   "
    ],
    "1": [
        "   ",
        "  |",
        "  |",
        "   "
    ],
    "2": [
        " _ ",
        " _|",
        "|_ ",
        "   "
    ],
    "3": [
        " _ ",
        " _|",
        " _|",
        "   "
    ],
    "4": [
        "   ",
        "|_|",
        "  |",
        "   "
    ],
    "5": [
        " _ ",
        "|_ ",
        " _|",
        "   "
    ],
    "6": [
        " _ ",
        "|_ ",
        "|_|",
        "   "
    ],
    "7": [
        " _ ",
        "  |",
        "  |",
        "   "
    ],
    "8": [
        " _ ",
        "|_|",
        "|_|",
        "   "
    ],
    "9": [
        " _ ",
        "|_|",
        " _|",
        "   "
    ]
}


def chunck(arr: list[Any], chunk_size: int) -> list[list[Any]]:
    return [arr[i:i+chunk_size] for i in range(0, len(arr), chunk_size)]


def get_grouped_chunks(grid: list[str]) -> list[list[str]]:
    """Convert a grid into chunks of size 3
    [
        "    _  _ ",
        "  | _| _|",
        "  ||_  _|",
        "         "
    ] => [
        [
            "   ",
            "  |",
            "  |",
            "   "
        ],
        [
            " _ ",
            " _|",
            "|_ ",
            "   "
        ],
        [
            " _ ",
            " _|",
            " _|",
            "   "
        ]
    ]
    """
    grouped_chuncks = [[] for _ in range(len(grid[0]) // 3)]

    for row in grid:
        for index, block in enumerate(chunck(row, 3)):
            grouped_chuncks[index].append(block)

    return grouped_chuncks


def convert_grid(grid: list[str]) -> str:
    """Convert a grid of size 4 into a string number
    [
        "    _  _ ",
        "  | _| _|",
        "  ||_  _|",
        "         "
    ] => 123
    """
    retval = ""

    for grouped_chunck in get_grouped_chunks(grid):
        for key, value in numbers.items():
            if grouped_chunck == value:
                retval += key
                break
        else:
            retval += "?"

    return retval


def convert(input_grid: list[str]) -> str:
    if len(input_grid) % 4 != 0:
        raise ValueError("Number of input lines is not a multiple of four")
    if len(input_grid[0]) % 3 != 0:
        raise ValueError("Number of input columns is not a multiple of three")

    grouped_grid = chunck(input_grid, 4)
    return ",".join(map(convert_grid, grouped_grid))
