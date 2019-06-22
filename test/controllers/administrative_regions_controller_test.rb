require 'test_helper'

class AdministrativeRegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrative_region = administrative_regions(:one)
  end

  test "should get index" do
    get administrative_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_administrative_region_url
    assert_response :success
  end

  test "should create administrative_region" do
    assert_difference('AdministrativeRegion.count') do
      post administrative_regions_url, params: { administrative_region: {  } }
    end

    assert_redirected_to administrative_region_url(AdministrativeRegion.last)
  end

  test "should show administrative_region" do
    get administrative_region_url(@administrative_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrative_region_url(@administrative_region)
    assert_response :success
  end

  test "should update administrative_region" do
    patch administrative_region_url(@administrative_region), params: { administrative_region: {  } }
    assert_redirected_to administrative_region_url(@administrative_region)
  end

  test "should destroy administrative_region" do
    assert_difference('AdministrativeRegion.count', -1) do
      delete administrative_region_url(@administrative_region)
    end

    assert_redirected_to administrative_regions_url
  end
end
