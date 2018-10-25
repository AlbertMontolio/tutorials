require 'test_helper'



class UserTest < ActiveSupport::TestCase
  test "email validation should trigger" do
    assert_not User.new(first_name: 'First Name', last_name: 'Last Name').save
  end

  test "user should save" do
    assert User.new(first_name: 'First Name', last_name: 'Last Name', email: 'name@example.org').save
  end
end
