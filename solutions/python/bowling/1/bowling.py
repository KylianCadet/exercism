import functools


class BowlingGame:
    def __init__(self):
        self._frames = [[None, None] for _ in range(12)]
        self._frame_count = 0
        self._second_shoot = False

    def roll(self, pins):
        frame = self._frames[int(self._frame_count)]

        if self.is_finished:
            raise ValueError('Cannot roll if game already finished')
        if pins < 0:
            raise ValueError('Cannot score negative points')
        if pins + (frame[0] or 0) > 10:
            raise ValueError('A roll cannot score more than 10 points')

        if not self._second_shoot:
            frame[0] = pins
            if pins != 10:
                self._second_shoot = True
            else:
                self._frame_count += 1
        else:
            frame[1] = pins
            self._second_shoot = False
            self._frame_count += 1

    def score(self) -> int:
        if not self.is_finished:
            raise ValueError('An incomplete game cannot be scored')

        def calc_frame_score(frame1, frame2, frame3) -> int:
            score = (frame1[0] or 0) + (frame1[1] or 0)
            if score == 10:
                score += (frame2[0] or 0)
                if score == 20:
                    score += (frame3[0] or 0)
                elif frame1[0] == 10:
                    score += (frame2[1] or 0)
            return score

        return functools.reduce(
            lambda acc, i: acc +
            calc_frame_score(
                self._frames[i],
                self._frames[i+1],
                self._frames[i+2]
            ),
            range(10),
            0)

    @property
    def is_finished(self) -> bool:
        return self._frames[11][0] is not None or \
            self._frames[10][1] is not None or \
            self._frames[10][0] is not None and self._frames[9][1] is not None or \
            self._frames[9][0] is not None and self._frames[9][1] is not None and self._frames[9][0] + \
            self._frames[9][1] != 10
