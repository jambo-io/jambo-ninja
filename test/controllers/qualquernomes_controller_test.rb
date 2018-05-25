require 'test_helper'

class QualquernomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qualquernome = qualquernomes(:one)
  end

  test "should get index" do
    get qualquernomes_url
    assert_response :success
  end

  test "should get new" do
    get new_qualquernome_url
    assert_response :success
  end

  test "should create qualquernome" do
    assert_difference('Qualquernome.count') do
      post qualquernomes_url, params: { qualquernome: {  } }
    end

    assert_redirected_to qualquernome_url(Qualquernome.last)
  end

  test "should show qualquernome" do
    get qualquernome_url(@qualquernome)
    assert_response :success
  end

  test "should get edit" do
    get edit_qualquernome_url(@qualquernome)
    assert_response :success
  end

  test "should update qualquernome" do
    patch qualquernome_url(@qualquernome), params: { qualquernome: {  } }
    assert_redirected_to qualquernome_url(@qualquernome)
  end

  test "should destroy qualquernome" do
    assert_difference('Qualquernome.count', -1) do
      delete qualquernome_url(@qualquernome)
    end

    assert_redirected_to qualquernomes_url
  end
end
