import random


class Robot:
    _names = set()

    def __init__(self):
        self._name = self._generate_random_unique_name()

    def _generate_random_unique_name(self):
        def randl(): return chr(random.randint(ord('A'), ord('Z')))
        def randn(): return str(random.randint(1, 9))

        name = ''.join(fn() for fn in [randl, randl, randn, randn, randn])
        if name in Robot._names:
            return self._generate_random_unique_name()

        Robot._names.add(name)
        return name

    def reset(self):
        self._name = self._generate_random_unique_name()
        Robot._names.remove(self._name)

    @property
    def name(self) -> str:
        return self._name
