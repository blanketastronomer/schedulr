module Features
  module UserHelpers
    def find_user(visitor = @visitor)
      @user ||= User.where(email: visitor[:email]).first
    end
  end
end