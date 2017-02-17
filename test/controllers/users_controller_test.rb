require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.new(username: 'example', password: 'foobar', password_confirmation: 'foobar')
    end

    
end
