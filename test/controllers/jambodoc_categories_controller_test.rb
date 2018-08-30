require 'test_helper'

class JambodocCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jambodoc_category = jambodoc_categories(:one)
  end

  test "should get index" do
    get jambodoc_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_jambodoc_category_url
    assert_response :success
  end

  test "should create jambodoc_category" do
    assert_difference('JambodocCategory.count') do
      post jambodoc_categories_url, params: { jambodoc_category: { desc: @jambodoc_category.desc, title: @jambodoc_category.title } }
    end

    assert_redirected_to jambodoc_category_url(JambodocCategory.last)
  end

  test "should show jambodoc_category" do
    get jambodoc_category_url(@jambodoc_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_jambodoc_category_url(@jambodoc_category)
    assert_response :success
  end

  test "should update jambodoc_category" do
    patch jambodoc_category_url(@jambodoc_category), params: { jambodoc_category: { desc: @jambodoc_category.desc, title: @jambodoc_category.title } }
    assert_redirected_to jambodoc_category_url(@jambodoc_category)
  end

  test "should destroy jambodoc_category" do
    assert_difference('JambodocCategory.count', -1) do
      delete jambodoc_category_url(@jambodoc_category)
    end

    assert_redirected_to jambodoc_categories_url
  end
end
