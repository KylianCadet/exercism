# Globals for the directions
# Change the values as you see fit
NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3


class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.x = x_pos
        self.y = y_pos

    def exec_instruction(self, instruction: str) -> None:
        if instruction == "R":
            self.direction += 1
            self.direction %= 4
        if instruction == "L":
            self.direction -= 1
            self.direction %= 4
        if instruction == "A":
            if self.direction == NORTH:
                self.y += 1
            if self.direction == SOUTH:
                self.y -= 1
            if self.direction == EAST:
                self.x += 1
            if self.direction == WEST:
                self.x -= 1

    def move(self, instructions: str) -> None:
        for instruction in instructions:
            self.exec_instruction(instruction)

    @property
    def coordinates(self) -> tuple[int, int]:
        return (self.x, self.y)
