require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(username: 'example', first_name: 'Example', last_name: 'User', password: 'password', password_confirmation: 'password' )
    end

    test 'user should be valid' do
        assert @user.valid?
    end
end
