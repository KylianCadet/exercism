def exchange_money(budget: float, exchange_rate: float) -> float:
    """This function return the value of the exchanged currency.

    :param budget: float - amount of money you are planning to exchange.
    :param exchange_rate: float - unit value of the foreign currency.
    :return: float - exchanged value of the foreign currency you can receive.
    """

    return budget / exchange_rate


def get_change(budget: float, exchanging_value: float) -> float:
    """This function return the amount of money that is left from the budget.

    :param budget: float - amount of money you own.
    :param exchanging_value: float - amount of your money you want to exchange now.
    :return: float - amount left of your starting currency after exchanging.
    """

    return budget - exchanging_value


def get_value_of_bills(denomination: int, number_of_bills: int) -> int:
    """This function return only the total value of the bills (excluding fractional amounts) the booth would give back.

    :param denomination: int - the value of a bill.
    :param number_of_bills: int - amount of bills you received.
    :return: int - total value of bills you now have.
    """

    return denomination * number_of_bills


def get_number_of_bills(budget: float, denomination: int) -> int:
    """This function return the number of currency bills that you can receive within the given budget.

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: int - number of bills after exchanging all your money.
    """

    return budget // denomination


def get_leftover_of_bills(budget: float, denomination: int) -> float:
    """This function return the leftover amount that cannot be exchanged from your budget given the denomination of bills.

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: float - the leftover amount that cannot be exchanged given the current denomination.
    """

    return budget % denomination


def exchangeable_value(budget: float, exchange_rate: float, spread: int, denomination: int) -> int:
    """This function return the maximum value of the new currency after calculating the exchange rate plus the spread.

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - maximum value you can get.
    """

    exchange_rate_with_fees = exchange_rate * spread / 100 + exchange_rate
    exchanged_budget = exchange_money(budget, exchange_rate_with_fees)
    number_of_bills = get_number_of_bills(exchanged_budget, denomination)
    return get_value_of_bills(denomination, number_of_bills)