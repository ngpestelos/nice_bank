Given /^my account has been credited with (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  my_account.credit(amount)
end

Then /^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  expect(my_account.balance).to equal(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

Then(/^I should be told that I have insufficient funds in my account$/) do
  page.should have_content("insufficient funds")
end
