def leap_year(year: int) -> bool:
    """Report if the year is a leap year

    A leap year in the Gregorian calendar occurs:
        - On every year that is evenly divisible by 4
        - Except every year that is evenly divisible by 100
        - Unless the year is also evenly divisible by 400

    Arguments:
        year -- year to determine

    Returns:
        Is the year a leap year
    """

    if year % 400 == 0:
        return year % 4 == 0
    return year % 4 == 0 and year % 100 != 0
