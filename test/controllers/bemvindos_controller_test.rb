require 'test_helper'

class BemvindosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bemvindo = bemvindos(:one)
  end

  test "should get index" do
    get bemvindos_url
    assert_response :success
  end

  test "should get new" do
    get new_bemvindo_url
    assert_response :success
  end

  test "should create bemvindo" do
    assert_difference('Bemvindo.count') do
      post bemvindos_url, params: { bemvindo: { Name: @bemvindo.Name, comentarios: @bemvindo.comentarios, email: @bemvindo.email, lastname: @bemvindo.lastname } }
    end

    assert_redirected_to bemvindo_url(Bemvindo.last)
  end

  test "should show bemvindo" do
    get bemvindo_url(@bemvindo)
    assert_response :success
  end

  test "should get edit" do
    get edit_bemvindo_url(@bemvindo)
    assert_response :success
  end

  test "should update bemvindo" do
    patch bemvindo_url(@bemvindo), params: { bemvindo: { Name: @bemvindo.Name, comentarios: @bemvindo.comentarios, email: @bemvindo.email, lastname: @bemvindo.lastname } }
    assert_redirected_to bemvindo_url(@bemvindo)
  end

  test "should destroy bemvindo" do
    assert_difference('Bemvindo.count', -1) do
      delete bemvindo_url(@bemvindo)
    end

    assert_redirected_to bemvindos_url
  end
end
