# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ORIGINAL_ADMIN_PASSWORD = 'ORIGINAL_ADMIN_PASSWORD'
original_admin_password = ENV[ORIGINAL_ADMIN_PASSWORD]

class EnvironmentVariableMissingError < StandardError
  def initialize(environment_variable)
    @environment_variable = environment_variable
  end

  def message
    "Environment variable #{@environment_variable} is missing!"
  end
end

class EnvironmentVariableBlankError < StandardError
  def initialize(environment_variable)
    @environment_variable = environment_variable
  end

  def message
    "Environment variable #{@environment_variable} is blank!"
  end
end

case
when original_admin_password.nil?
  raise EnvironmentVariableMissingError.new(ORIGINAL_ADMIN_PASSWORD)
when original_admin_password.blank?
  raise EnvironmentVariableBlankError.new(ORIGINAL_ADMIN_PASSWORD)
else
  User.create(email: 'admin@example.com', password: ENV[ORIGINAL_ADMIN_PASSWORD])
end
