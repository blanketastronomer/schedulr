module Features
  module VisitorHelpers
    def create_visitor_with(email: 'user@example.com', password: 'password', password_confirmation: 'password')
      @visitor ||= {
          email: email,
          password: password,
          password_confirmation: password_confirmation
      }
    end
  end
end