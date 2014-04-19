Then(/^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/) do |amount|
  cash_slot.contents.should == amount
end

Then(/^nothing should be dispensed$/) do
  expect(cash_slot.contents).to be_nil
end
