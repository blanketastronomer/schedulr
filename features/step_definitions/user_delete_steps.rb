When(/^I click on the delete account button$/) do
  click_button 'Cancel my account'
  page.driver.browser.switch_to.alert.accept
end

Then(/^My account should be deleted$/) do
  expect(page).to have_text I18n.t 'devise.registrations.destroyed'
end