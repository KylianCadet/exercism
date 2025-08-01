import datetime


def add(moment: datetime.datetime) -> datetime.datetime:
    return moment + datetime.timedelta(seconds=1_000_000_000)
