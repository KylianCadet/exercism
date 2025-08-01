from typing import Any


class Node:
    def __init__(self, value: Any):
        self._value = value
        self._next: 'Node' = None

    def value(self) -> Any:
        return self._value

    def next(self) -> 'Node':
        return self._next

    def set_next(self, value: Any) -> None:
        self._next = value


class LinkedList:
    def __init__(self, values=[]):
        self.nodes: list[Node] = []
        for value in values:
            self.push(value)

    def __len__(self):
        return len(self.nodes)

    def __iter__(self):
        return iter(map(lambda node: node.value(), self.nodes))

    def head(self) -> Node:
        try:
            return self.nodes[0]
        except IndexError as exc:
            raise EmptyListException("The list is empty.") from exc

    def push(self, value: Any) -> None:
        self.nodes[0:0] = [Node(value)]
        if len(self.nodes) >= 2:
            self.nodes[0].set_next(self.nodes[1])

    def pop(self) -> Any:
        try:
            return self.nodes.pop(0).value()
        except IndexError as exc:
            raise EmptyListException("The list is empty.") from exc

    def reversed(self) -> list[Any]:
        return list(self)[::-1]


class EmptyListException(Exception):
    pass
