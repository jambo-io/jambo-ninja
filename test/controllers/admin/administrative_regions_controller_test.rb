require 'test_helper'

class Admin::AdministrativeRegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_administrative_region = admin_administrative_regions(:one)
  end

  test "should get index" do
    get admin_administrative_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_administrative_region_url
    assert_response :success
  end

  test "should create admin_administrative_region" do
    assert_difference('Admin::AdministrativeRegion.count') do
      post admin_administrative_regions_url, params: { admin_administrative_region: {  } }
    end

    assert_redirected_to admin_administrative_region_url(Admin::AdministrativeRegion.last)
  end

  test "should show admin_administrative_region" do
    get admin_administrative_region_url(@admin_administrative_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_administrative_region_url(@admin_administrative_region)
    assert_response :success
  end

  test "should update admin_administrative_region" do
    patch admin_administrative_region_url(@admin_administrative_region), params: { admin_administrative_region: {  } }
    assert_redirected_to admin_administrative_region_url(@admin_administrative_region)
  end

  test "should destroy admin_administrative_region" do
    assert_difference('Admin::AdministrativeRegion.count', -1) do
      delete admin_administrative_region_url(@admin_administrative_region)
    end

    assert_redirected_to admin_administrative_regions_url
  end
end
