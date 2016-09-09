require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user can be created as an admin" do
    user = User.create(username: "test",
                       password: "password",
                       role: 1)

    assert_equal user.role, "admin"
    assert user.admin?
  end

  test "user can be created as a default user" do
    user = User.create(username: "test",
                       password: "password")

    assert_equal user.role, "default"
    assert user.default?
  end
end
