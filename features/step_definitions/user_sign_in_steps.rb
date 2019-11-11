include Warden::Test::Helpers
Warden.test_mode!
After { Warden.test_reset! }

AUTHENTICATION_KEYS = 'Email'

When(/^I sign in with valid data$/) do
  user = FactoryBot.build(:user)
  create_visitor_with email: user.email, password: user.password, password_confirmation: user.password
  sign_in_with visitor: @visitor
end

Then(/^I should see an invalid user message$/) do
  expect(page).to have_text I18n.t 'devise.failure.invalid', authentication_keys: AUTHENTICATION_KEYS
end

And(/^I have an account$/) do
  user = FactoryBot.create(:user)
end

Then(/^I should see a successful sign in message$/) do
  expect(page).to have_text I18n.t 'devise.sessions.signed_in'
end

When(/^I sign in with an incorrect email$/) do
  user = FactoryBot.build(:user)
  create_visitor_with email: user.email, password: user.password, password_confirmation: user.password

  @visitor = @visitor.merge(email: 'wrong_email@example.com')
  sign_in_with visitor: @visitor
end

Then(/^I should see an invalid email address message$/) do
  expect(page).to have_text I18n.t 'devise.failure.invalid', authentication_keys: AUTHENTICATION_KEYS
end

When(/^I sign in with an incorrect password$/) do
  user = FactoryBot.build(:user)
  create_visitor_with email: user.email, password: user.password, password_confirmation: user.password

  @visitor = @visitor.merge(password: 'wrong_password')
  sign_in_with visitor: @visitor
end

Then(/^I should see an invalid password message$/) do
  expect(page).to have_text I18n.t 'devise.failure.invalid', authentication_keys: AUTHENTICATION_KEYS
end