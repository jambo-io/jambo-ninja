require 'test_helper'

class AdministrativeFunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrative_function = administrative_functions(:one)
  end

  test "should get index" do
    get administrative_functions_url
    assert_response :success
  end

  test "should get new" do
    get new_administrative_function_url
    assert_response :success
  end

  test "should create administrative_function" do
    assert_difference('AdministrativeFunction.count') do
      post administrative_functions_url, params: { administrative_function: { name: @administrative_function.name } }
    end

    assert_redirected_to administrative_function_url(AdministrativeFunction.last)
  end

  test "should show administrative_function" do
    get administrative_function_url(@administrative_function)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrative_function_url(@administrative_function)
    assert_response :success
  end

  test "should update administrative_function" do
    patch administrative_function_url(@administrative_function), params: { administrative_function: { name: @administrative_function.name } }
    assert_redirected_to administrative_function_url(@administrative_function)
  end

  test "should destroy administrative_function" do
    assert_difference('AdministrativeFunction.count', -1) do
      delete administrative_function_url(@administrative_function)
    end

    assert_redirected_to administrative_functions_url
  end
end
