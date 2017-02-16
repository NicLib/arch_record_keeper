require 'test_helper'

class AuthenticateUsersTest < ActionDispatch::IntegrationTest
  def setup
      @user = User.new(username: 'exampleuser', password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should authenticate users' do
      password = 'foobar'
      assert @user.authenticate(password)
  end

  test 'should get jobs after log in' do
      password = @user.password
      username = @user.username
      get root_path
      assert login_path
      post  login_path, params: {session: {username: username, password: password}}
      assert jobs_path
  end

  test 'should not get jobs when not logged in' do
      get jobs_path
      assert root_path
  end

  test 'should not get users when not logged in' do
      get users_path
      assert root_path
  end

  test 'should be able to get pages after login' do
      password = @user.password
      username = @user.username
      get root_path
      assert login_path
      post login_path, params: { session: {username: username, password: password}}
      assert jobs_path
      get users_path
      assert users_path
      get jobs_path
      assert jobs_path
  end
end
