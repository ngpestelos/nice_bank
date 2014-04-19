class Account
  def deposit(amount)
    @balance = amount.to_i
  end

  def balance
    @balance
  end
end

class Teller
  def withdraw_from(account, amount)

  end
end

CAPTURE_CASH_AMOUNT = Transform /^\$(\d+)$/ do |digits|
  digits.to_i
end

Given /^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  @my_account = Account.new
  @my_account.deposit(amount)
  expect(@my_account.balance).to equal(amount.to_i),
    "Expected the balance to be #{amount} but it was #{@my_account.balance}"
end

When(/^I withdraw (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  teller = Teller.new
  teller.withdraw_from(@my_account, amount)
end

Then(/^\$(\d+) should be dispensed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
