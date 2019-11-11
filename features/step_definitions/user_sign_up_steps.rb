include Warden::Test::Helpers
Warden.test_mode!

include Features::SessionHelpers
include Features::VisitorHelpers
include Features::UserHelpers

VALID_EMAIL = 'test_user@example.com'
INVALID_EMAIL = 'invalid_test_user_email'
PASSWORD = 't3st_us3r_p@ss'

Given(/^I am not logged in$/) do
  sign_out
end

And(/^I do not have an account$/) do
  create_visitor_with email: VALID_EMAIL, password: PASSWORD, password_confirmation: PASSWORD
  find_user @visitor

  expect(@user).to be_nil
end

When(/^I sign up with valid data$/) do
  sign_up_with visitor: @visitor
end

Then(/^I should see a successful sign up message$/) do
  expect(page).to have_text I18n.t 'devise.registrations.signed_up'
end

When(/^I sign up with an invalid email address$/) do
  @visitor = @visitor.merge(email: INVALID_EMAIL)
  sign_up_with visitor: @visitor
end

Then(/^I should see an invalid email message$/) do
  devise_error = I18n.t 'errors.messages.not_saved.one', resource: 'user'
  regex = Regexp.new("#{devise_error}|characters minimum")
  expect(page).to have_text regex
end

When(/^I sign up without a password$/) do
  @visitor = @visitor.merge(password: '')
  sign_up_with visitor: @visitor
end

Then(/^I should see a missing password message$/) do
  devise_error = I18n.t 'errors.messages.not_saved.other', resource: 'user', count: 2
  sign_up_with visitor: @visitor
  expect(page).to have_text devise_error
end

When(/^I sign up without a confirmed password$/) do
  @visitor = @visitor.merge(password_confirmation: '')
  sign_up_with visitor: @visitor
end

Then(/^I should see a missing confirmation password message$/) do
  sign_up_with visitor: @visitor
  expect(page).to have_text I18n.t 'errors.messages.not_saved.one', resource: 'user'
end

When(/^I sign up with a mismatched password and password confirmation$/) do
  @visitor = @visitor.merge(password: PASSWORD, password_confirmation: 'password123')
  sign_up_with visitor: @visitor
end

Then(/^I should see a mismatched password message$/) do
  expect(page).to have_text 'prohibited this user from being saved'
end