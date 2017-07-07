require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get contributing" do
    get themes_contributing_url
    assert_response :success
  end

  test "should get twofold" do
    get themes_twofold_url
    assert_response :success
  end

  test "should get early_adolescence" do
    get themes_early_adolescence_url
    assert_response :success
  end

  test "should get selfless" do
    get themes_selfless_url
    assert_response :success
  end

  test "should get friendship" do
    get themes_friendship_url
    assert_response :success
  end

  test "should get coherence" do
    get themes_coherence_url
    assert_response :success
  end

  test "should get youth" do
    get themes_youth_url
    assert_response :success
  end

  test "should get qualities" do
    get themes_qualities_url
    assert_response :success
  end

  test "should get building" do
    get themes_building_url
    assert_response :success
  end

end
