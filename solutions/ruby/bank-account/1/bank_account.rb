=begin
Write your code for the 'Bank Account' exercise in this file. Make the tests in
`bank_account_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bank-account` directory.
=end

class BankAccount
  def initialize
    @is_open = false
    @balance = 0
  end

  def balance
    raise ArgumentError.new("You can't check the balance of a closed account") unless @is_open
    @balance
  end

  def open
    raise ArgumentError.new("You can't open an already open account") if @is_open
    @is_open = true
  end

  def close
    raise ArgumentError.new("You can't close an already closed account") unless @is_open
    @is_open = false
    @balance = 0
  end

  def deposit(amount)
    raise ArgumentError.new("You can't deposit money into a closed account") unless @is_open
    raise ArgumentError.new("You can't deposit a negative amount") if amount < 0
    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError.new("You can't withdraw money into a closed account") unless @is_open
    raise ArgumentError.new("You can't withdraw more than you have") if amount > @balance
    raise ArgumentError.new("You can't withdraw a negative amount") if amount < 0
    @balance -= amount
  end
end
