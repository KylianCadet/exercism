class Clock:
    def __init__(self, hour, minute):
        self.hour = 0
        self.minute = 0
        self._overflow_add(hour, minute)

    def __repr__(self):
        return f"Clock({self.hour}, {self.minute})"

    def __str__(self):
        return f"{self.hour:02}:{self.minute:02}"

    def __eq__(self, other):
        return self.hour*60+self.minute == other.hour*60+other.minute

    def _overflow_add(self, hours=0, minutes=0):
        self.hour += hours
        self.minute += minutes
        overflow_hours = self.minute // 60
        self.hour += overflow_hours
        self.minute %= 60
        self.hour %= 24

    def __add__(self, minutes):
        self._overflow_add(minutes=minutes)
        return self

    def __sub__(self, minutes):
        self._overflow_add(minutes=-minutes)
        return self
