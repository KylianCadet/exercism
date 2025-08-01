module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      return 3.213
    end
    case balance.floor
    when 0..999
      0.5
    when 1_000..4_999
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + balance * interest_rate(balance) / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end
    year
  end
end
