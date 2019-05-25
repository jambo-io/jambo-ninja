require 'test_helper'

class ParticipantRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant_role = participant_roles(:one)
  end

  test "should get index" do
    get participant_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_role_url
    assert_response :success
  end

  test "should create participant_role" do
    assert_difference('ParticipantRole.count') do
      post participant_roles_url, params: { participant_role: { name: @participant_role.name } }
    end

    assert_redirected_to participant_role_url(ParticipantRole.last)
  end

  test "should show participant_role" do
    get participant_role_url(@participant_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_role_url(@participant_role)
    assert_response :success
  end

  test "should update participant_role" do
    patch participant_role_url(@participant_role), params: { participant_role: { name: @participant_role.name } }
    assert_redirected_to participant_role_url(@participant_role)
  end

  test "should destroy participant_role" do
    assert_difference('ParticipantRole.count', -1) do
      delete participant_role_url(@participant_role)
    end

    assert_redirected_to participant_roles_url
  end
end
