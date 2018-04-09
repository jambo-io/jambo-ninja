require 'test_helper'

class EventosbahaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventosbahai = eventosbahais(:one)
  end

  test "should get index" do
    get eventosbahais_url
    assert_response :success
  end

  test "should get new" do
    get new_eventosbahai_url
    assert_response :success
  end

  test "should create eventosbahai" do
    assert_difference('Eventosbahai.count') do
      post eventosbahais_url, params: { eventosbahai: { city: @eventosbahai.city, description: @eventosbahai.description, end_at: @eventosbahai.end_at, location: @eventosbahai.location, name: @eventosbahai.name, price: @eventosbahai.price, start_at: @eventosbahai.start_at, state: @eventosbahai.state, theme: @eventosbahai.theme, vacancies: @eventosbahai.vacancies } }
    end

    assert_redirected_to eventosbahai_url(Eventosbahai.last)
  end

  test "should show eventosbahai" do
    get eventosbahai_url(@eventosbahai)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventosbahai_url(@eventosbahai)
    assert_response :success
  end

  test "should update eventosbahai" do
    patch eventosbahai_url(@eventosbahai), params: { eventosbahai: { city: @eventosbahai.city, description: @eventosbahai.description, end_at: @eventosbahai.end_at, location: @eventosbahai.location, name: @eventosbahai.name, price: @eventosbahai.price, start_at: @eventosbahai.start_at, state: @eventosbahai.state, theme: @eventosbahai.theme, vacancies: @eventosbahai.vacancies } }
    assert_redirected_to eventosbahai_url(@eventosbahai)
  end

  test "should destroy eventosbahai" do
    assert_difference('Eventosbahai.count', -1) do
      delete eventosbahai_url(@eventosbahai)
    end

    assert_redirected_to eventosbahais_url
  end
end
