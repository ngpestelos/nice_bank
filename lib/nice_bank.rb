class Account
  def credit(amount)
    @balance = amount.to_i
  end

  def debit(amount)
    @balance -= amount
  end

  def balance
    @balance
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    if account.balance >= amount
      account.debit(amount)
      return @cash_slot.dispense(amount)
    end
  end
end

class CashSlot
  def contents
    @contents
  end

  def dispense(amount)
    @contents = amount
  end
end

require 'sinatra'
get '/' do
  %{
  <html>
    <body>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="text" id="amount" name="amount" value="$20">
        <button type="submit">Withdraw</button>
      </form>
    </body>
  </html>
  }
end

set :cash_slot, CashSlot.new
set :account do
  fail 'account has not been set'
end
post '/withdraw' do
  teller = Teller.new(settings.cash_slot)
  dispensed = teller.withdraw_from(settings.account, params[:amount].to_i)
  "<p>You have insufficient funds in your account.</p>" if dispensed.nil?
end
