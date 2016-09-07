require 'test_helper'

class MyTest < ActionDispatch::IntegrationTest
		test "should get home" do
				get "/"
				assert_response :success
				assert_select "title", "Ruby on Rails Tutorial Sample App"
			end
	end