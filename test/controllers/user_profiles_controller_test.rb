require 'test_helper'

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_profile = user_profiles(:one)
  end

  test "should get index" do
    get user_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_user_profile_url
    assert_response :success
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post user_profiles_url, params: { user_profile: { address: @user_profile.address, birthday: @user_profile.birthday, city: @user_profile.city, email: @user_profile.email, lastname: @user_profile.lastname, name: @user_profile.name, number: @user_profile.number, phone: @user_profile.phone, state: @user_profile.state, zipcode: @user_profile.zipcode } }
    end

    assert_redirected_to user_profile_url(UserProfile.last)
  end

  test "should show user_profile" do
    get user_profile_url(@user_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_profile_url(@user_profile)
    assert_response :success
  end

  test "should update user_profile" do
    patch user_profile_url(@user_profile), params: { user_profile: { address: @user_profile.address, birthday: @user_profile.birthday, city: @user_profile.city, email: @user_profile.email, lastname: @user_profile.lastname, name: @user_profile.name, number: @user_profile.number, phone: @user_profile.phone, state: @user_profile.state, zipcode: @user_profile.zipcode } }
    assert_redirected_to user_profile_url(@user_profile)
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete user_profile_url(@user_profile)
    end

    assert_redirected_to user_profiles_url
  end
end
