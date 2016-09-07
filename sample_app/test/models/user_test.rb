require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	def setup
		@user = User.new(name: "Example User", email: "user@example.com",password: "foobar", password_confirmation: "foobar")
	end
	test "should be valid" do
			assert @user.valid?
		end
	test "name should be present" do
		@user.name = "		"
		assert_not @user.valid?
	end
	test "email should be present" do
		puts @user.inspect
		@user.email = nil
		puts @user.inspect
		assert_not @user.valid?
	end
	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			# puts @user.inspect
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end
	test "email addresses should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end
end
