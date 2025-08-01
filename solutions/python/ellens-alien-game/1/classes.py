"""Solution to Ellen's Alien Game exercise."""

from typing import Union

import functools


class Alien:
    """Create an Alien object with location x_coordinate and y_coordinate.

    Attributes
    ----------
    (class)total_aliens_created: int
    x_coordinate: int - Position on the x-axis.
    y_coordinate: int - Position on the y-axis.
    health: int - Amount of health points.

    Methods
    -------
    hit(): Decrement Alien health by one point.
    is_alive(): Return a boolean for if Alien is alive (if health is > 0).
    teleport(new_x_coordinate, new_y_coordinate): Move Alien object to new coordinates.
    collision_detection(other): Implementation TBD.
    """

    total_aliens_created: int = 0

    _x_coordinate: Union[int, None] = None
    _y_coordinate: Union[int, None] = None
    _health: int = 3

    def __init__(self, x_coordinate: int, y_coordinate: int) -> None:
        self._x_coordinate = x_coordinate
        self._y_coordinate = y_coordinate
        Alien.total_aliens_created += 1

    @property
    def health(self) -> int:
        """Get alien health

        Returns:
            Alien health
        """
        return self._health

    @property
    def x_coordinate(self) -> Union[int, None]:
        """Get alien x coordinate

        Returns:
            Alien x coordinate
        """
        return self._x_coordinate

    @property
    def y_coordinate(self) -> Union[int, None]:
        """Get alien y coordinate

        Returns:
            Alien y coordinate
        """
        return self._y_coordinate

    @health.setter
    def health(self, value) -> None:
        self._health = value

    @x_coordinate.setter
    def x_coordinate(self, value) -> None:
        self._x_coordinate = value

    @y_coordinate.setter
    def y_coordinate(self, value) -> None:
        self._y_coordinate = value

    def hit(self) -> None:
        """Decrement Alien health by one point.
        """
        self.health -= 1

    def is_alive(self) -> bool:
        """Return a boolean for if Alien is alive (if health is > 0).

        Returns:
            True if alien is alive else False
        """
        return self.health > 0

    def teleport(self, new_x_coordinate: int, new_y_coordinate: int) -> None:
        """Move Alien object to new coordinates.

        Arguments:
            new_x_coordinate -- new x coordinate
            new_y_coordinate -- new y coordinate
        """

        self.x_coordinate = new_x_coordinate
        self.y_coordinate = new_y_coordinate

    def collision_detection(self, other: 'Alien') -> bool:
        """TODO Check if Alien is in coolision with another Alien

        Arguments:
            other -- Other Alien

        Returns:
            True if both Alien are in collision else False
        """


def new_aliens_collection(coordinates: list[tuple[int, int]]) -> list[Alien]:
    """Create a list of aliens based on a list of coordinates

    Arguments:
        coordinates -- List of coordinates

    Returns:
        List of Alien
    """
    return functools.reduce(
        lambda acc, coordinate: acc + [Alien(coordinate[0], coordinate[1])],
        coordinates, []
    )
