module Features
  module UserHelpers
    def add_user(visitor = @visitor)
      User.new(email: visitor[:email], password: visitor[:password], password_confirmation: visitor[:password_confirmation]).save!
    end

    def find_user(visitor = @visitor)
      @user ||= User.where(email: visitor[:email]).first
    end
  end
end