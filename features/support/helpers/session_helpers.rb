module Features
  module SessionHelpers
    def sign_up_with(visitor: )
      visit new_user_registration_path
      fill_in 'user_email', with: visitor[:email]
      fill_in 'user_password', with: visitor[:password]
      fill_in 'user_password_confirmation', with: visitor[:password_confirmation]
      click_button 'Sign up'
      find_user
    end

    def sign_in_with(visitor: )
      visit new_user_session_path
      fill_in 'user_email', with: visitor[:email]
      fill_in 'user_password', with: visitor[:password]
      click_button 'Log in'
      find_user
    end

    def sign_out
      if page.has_selector? '#logout'
        find_link(id: 'logout').click
      end
    end
  end
end