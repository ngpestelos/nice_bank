Given /^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.deposit(amount)
  expect(my_account.balance).to equal(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

Then /^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  expect(my_account.balance).to equal(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end
