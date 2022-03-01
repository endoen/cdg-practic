class CashMachine
  BALANCE_FILE_PATH = 'balance.txt'.freeze
  DEFAULT_BALANCE = 100.0

  def initialize
    @balance = if File.file?(BALANCE_FILE_PATH) && !File.zero?(BALANCE_FILE_PATH)
                 File.readlines(BALANCE_FILE_PATH).first.to_f
               else
                 DEFAULT_BALANCE
               end
  end

  def balance
    "Your balance: #{@balance}"
  end

  def deposit(value)
    if value <= 0
      'Error: the deposit amount must be greater than zero!'
    else
      @balance += value
      balance
    end
  end

  def withdraw(value)
    if value <= 0
      'Error: the withdraw amount must be greater than zero!'
    elsif value > @balance
      'Error: Insufficient funds for withdrawal!'
    else
      @balance -= value
      balance
    end
  end

  def write_balance
    File.open(BALANCE_FILE_PATH, 'w') { |f| f.write(@balance) }
  end
end
