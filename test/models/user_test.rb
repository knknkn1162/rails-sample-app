require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*244+"@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    %w[user@example,com
      user_at_foo.org 
      user.name@example.foo@bar_baz.com
      foo@bar+baz.com].each do |addr|
      @user.email = addr
      assert_not @user.valid?, "#{addr.inspect} should be valid"
    end
  end

end