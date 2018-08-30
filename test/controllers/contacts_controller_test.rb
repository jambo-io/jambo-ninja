require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { activities: @contact.activities, address: @contact.address, birthday: @contact.birthday, email: @contact.email, lastname: @contact.lastname, name: @contact.name, number: @contact.number, pc: @contact.pc, phone: @contact.phone, state: @contact.state, video: @contact.video } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { activities: @contact.activities, address: @contact.address, birthday: @contact.birthday, email: @contact.email, lastname: @contact.lastname, name: @contact.name, number: @contact.number, pc: @contact.pc, phone: @contact.phone, state: @contact.state, video: @contact.video } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
