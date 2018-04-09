require 'test_helper'

class ConferenciasdeunidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conferenciasdeunidade = conferenciasdeunidades(:one)
  end

  test "should get index" do
    get conferenciasdeunidades_url
    assert_response :success
  end

  test "should get new" do
    get new_conferenciasdeunidade_url
    assert_response :success
  end

  test "should create conferenciasdeunidade" do
    assert_difference('Conferenciasdeunidade.count') do
      post conferenciasdeunidades_url, params: { conferenciasdeunidade: { description: @conferenciasdeunidade.description, end_at: @conferenciasdeunidade.end_at, location: @conferenciasdeunidade.location, name: @conferenciasdeunidade.name, start_at: @conferenciasdeunidade.start_at } }
    end

    assert_redirected_to conferenciasdeunidade_url(Conferenciasdeunidade.last)
  end

  test "should show conferenciasdeunidade" do
    get conferenciasdeunidade_url(@conferenciasdeunidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_conferenciasdeunidade_url(@conferenciasdeunidade)
    assert_response :success
  end

  test "should update conferenciasdeunidade" do
    patch conferenciasdeunidade_url(@conferenciasdeunidade), params: { conferenciasdeunidade: { description: @conferenciasdeunidade.description, end_at: @conferenciasdeunidade.end_at, location: @conferenciasdeunidade.location, name: @conferenciasdeunidade.name, start_at: @conferenciasdeunidade.start_at } }
    assert_redirected_to conferenciasdeunidade_url(@conferenciasdeunidade)
  end

  test "should destroy conferenciasdeunidade" do
    assert_difference('Conferenciasdeunidade.count', -1) do
      delete conferenciasdeunidade_url(@conferenciasdeunidade)
    end

    assert_redirected_to conferenciasdeunidades_url
  end
end
