def orbital_period_time(seconds: int, period: float) -> float:
    print(period)
    return round(seconds / (31557600 * period), 2)


class SpaceAge:
    def __init__(self, seconds):
        self.seconds = seconds
        for function_name, function_lambda in [
            ('on_mercury',
             lambda self: orbital_period_time(self.seconds, 0.2408467)),
            ('on_venus',
             lambda self: orbital_period_time(self.seconds, 0.61519726)),
            ('on_earth',
             lambda self: orbital_period_time(self.seconds, 1.0)),
            ('on_mars',
             lambda self: orbital_period_time(self.seconds, 1.8808158)),
            ('on_jupiter',
             lambda self: orbital_period_time(self.seconds, 11.862615)),
            ('on_saturn',
             lambda self: orbital_period_time(self.seconds, 29.447498)),
            ('on_uranus',
             lambda self: orbital_period_time(self.seconds, 84.016846)),
            ('on_neptune',
             lambda self: orbital_period_time(self.seconds, 164.79132))
        ]:
            setattr(self.__class__, function_name, function_lambda)
