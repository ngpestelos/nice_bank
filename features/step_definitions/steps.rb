class Account
  def deposit(amount)
    @balance = amount.to_i
  end

  def balance
    @balance
  end
end

Given /^I have deposited \$(\d+) in my account$/ do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  expect(my_account.balance).to equal(amount.to_i),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When(/^I request \$(\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^\$(\d+) should be dispensed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
