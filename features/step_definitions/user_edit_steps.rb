include Warden::Test::Helpers
Warden.test_mode!
After { Warden.test_reset! }

And(/^I visit the Edit User page$/) do
  visit edit_user_registration_path
end

When(/^I edit my email address$/) do
  email_user, email_domain = @visitor[:email].split('@')
  email_user += '_1'

  new_email = "#{email_user}@#{email_domain}"

  fill_in 'user_email', with: new_email
end

And(/^I enter my current password$/) do
  fill_in 'user_current_password', with: @visitor[:password]
end

And(/^I save the edit form$/) do
  click_button 'Update'
end

Then(/^I should see a successful account edited message$/) do
  expect(page).to have_text I18n.t 'devise.registrations.updated'
end

When(/^I edit my password$/) do
  new_password = @visitor[:password] + '123'
  fill_in 'user_password', with: new_password
  fill_in 'user_password_confirmation', with: new_password
end

Then(/^I should see a missing password and current password message$/) do
  expect(page).to have_text 'prohibited this user from being saved'
end

And(/^I don't enter my current password$/) do
  fill_in 'user_current_password', with: ''
end

And(/^I don't enter my password confirmation$/) do
  fill_in 'user_password_confirmation', with: ''
end

And(/^I enter the wrong password confirmation$/) do
  fill_in 'user_password_confirmation', with: @visitor[:password] + '123'
end