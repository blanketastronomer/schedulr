include Features::UserHelpers

Given(/^I exist as a user$/) do
  create_visitor_with email: VALID_EMAIL, password: PASSWORD, password_confirmation: PASSWORD

  add_user @visitor
end

And(/^I am logged in$/) do
  sign_in_with visitor: @visitor
  expect(page).to have_text I18n.t 'devise.sessions.signed_in'
end

When(/^I sign out$/) do
  sign_out
end

Then(/^I should see a successful sign out message$/) do
  expect(page).to have_text I18n.t 'devise.sessions.signed_out'
end

When(/^I return to the site$/) do
  visit root_path
end

Then(/^I should be signed out$/) do
  expect(page).to have_text I18n.t 'navigation.sign_in'
end